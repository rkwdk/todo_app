import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.title = doc.get('title');
    this.createdAt = doc.get('createdAt');
  }
  String title;
  DateTime createdAt;
}
