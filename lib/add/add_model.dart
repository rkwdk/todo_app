import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => AddModel());

class AddModel extends ChangeNotifier {
  AddModel();

  String todoText = "";

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('todoList');
    collection.add(
      {
        "title": todoText,
        "createdAt": Timestamp.now(),
      },
    );
  }
}
