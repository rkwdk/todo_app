import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.title = doc.get('title');
    Timestamp timeStamp = doc.get('createdAt');
    this.createdAt = timeStamp.toDate();
  }
  String title;
  DateTime createdAt;
}
