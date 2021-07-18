import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/todo.dart';

final mainModelProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  MainModel() {
    getTodoListRealTime();
  }

  List<Todo> todoList = [];

  Future getTodoList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;
    notifyListeners();
  }

  void getTodoListRealTime() {
    final snapshots =
        FirebaseFirestore.instance.collection('todoList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();
    });
  }

  void updateDone(Todo targetTodo, bool isDone) {
    final goalTodo = todoList.firstWhere((todo) => todo == targetTodo);
    goalTodo.isDone = isDone;
    notifyListeners();
  }

  Future deleteCheckedItems() async {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    final references = checkedItems.map((e) => e.documentReference).toList();
    final batch = FirebaseFirestore.instance.batch();

    references.forEach((reference) {
      batch.delete(reference);
    });
    return batch.commit();
  }

  bool checkShouldActiveCompleteButton() {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    return checkedItems.length > 0;
  }
}
