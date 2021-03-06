import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  Timestamp messageDate;
  String photoUrl;
  String text;
  String userReceptor;
  String userSender;
  bool viewed = false;

  Message({
    this.messageDate,
    this.photoUrl,
    this.text,
    this.userReceptor,
    this.userSender,
  });

  Message.fromDocument(DocumentSnapshot document) {
    messageDate = document['messageDate'] as Timestamp;
    photoUrl = document['photoUrl'] as String;
    text = document['text'] as String;
    userReceptor = document['userReceptor'] as String;
    userSender = document['userSender'] as String;
  }
}
