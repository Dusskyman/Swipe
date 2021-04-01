import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_test_pj/models/user_api/user.dart';
import 'package:flutter_test_pj/models/user_api/user_to_database.dart';

import 'package:uuid/uuid.dart';

class AddUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Map<String, String> text) async {
    String uid = Uuid().v1();
    User user = User(
      name: text['name'],
      surname: text['surname'],
      phone: text['phone'],
      email: text['email'],
      uid: uid,
      createdAt: Timestamp.now(),
    );

    return users.doc(uid).set(UserToDataBase(user).toMap());
  }
}
