import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_test_pj/models/user_api/user_from_database.dart';
import 'package:flutter_test_pj/models/user_api/user_to_database.dart';


class AddUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Map<String, String> text) async {
    UserFromDatabase user = UserFromDatabase(
      name: text['name'],
      surname: text['surname'],
      phone: text['phone'],
      email: text['email'],
      uid: FirebaseAuth.instance.currentUser.uid,
      createdAt: Timestamp.now(),
    );

    return users
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set(UserToDataBase(user).toMap());
  }
}
