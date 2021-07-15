import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/todo.dart';

final mainModelProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  MainModel() {
    getTodoList();
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
}
