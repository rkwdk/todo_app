import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    this.title = doc.get('title');
    Timestamp timeStamp = doc.get('createdAt');
    this.createdAt = timeStamp.toDate();
    this.isDone = false;
  }
  String title;
  DateTime createdAt;
  bool isDone;
  DocumentReference documentReference;
}
