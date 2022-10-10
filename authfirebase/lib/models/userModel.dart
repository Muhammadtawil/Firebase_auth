import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  Timestamp accountCreated;
  String fullName;
  String groupId;
  String notifToken;

  UserModel({
    required this.uid,
    required this.email,
    required this.accountCreated,
    required this.fullName,
    required this.groupId,
    required this.notifToken,
  });

  // UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
  //   uid = doc.documentID;
  //   email = doc.data['email'];
  //   accountCreated = doc.data['accountCreated'];
  //   fullName = doc.data['fullName'];
  //   groupId = doc.data['groupId'];
  //   notifToken = doc.data['notifToken'];
  // }
}
