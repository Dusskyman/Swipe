import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_pj/models/user_api/user_from_database.dart';
import 'package:flutter_test_pj/models/user_api/user_to_database.dart';

class UserDataApi {
  static Future<void> uploadData({
    String name,
    String surname,
    String email,
    String photoURL,
  }) async {
    UserFromDatabase userFromDatabase = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => UserFromDatabase.fromMap(value.data()));
    userFromDatabase = userFromDatabase.copyWith(
      name: name,
      surname: surname,
      email: email,
      photoURL: photoURL,
      updatedAt: Timestamp.now(),
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set(UserToDataBase(userFromDatabase).toMap());
  }

  static Future<UserFromDatabase> getData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => UserFromDatabase.fromMap(value.data()));
  }
}
