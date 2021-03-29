import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_test_pj/models/user.dart';
import 'package:flutter_test_pj/models/user_to_database.dart';

import 'package:uuid/uuid.dart';

class AddUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var _uuid = Uuid();

  Future<void> addUser(Map<String, String> text) async {
    String _uid = _uuid.v1();
    User user = User(
      name: text['name'],
      surname: text['surname'],
      phone: text['phone'],
      email: text['email'],
      uid: _uid,
      createdAt: Timestamp.now(),
    );

    return users.doc(_uid).set(UserToDataBase(user).toMap());
  }
}
