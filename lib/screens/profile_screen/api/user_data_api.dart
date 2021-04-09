import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_pj/models/user_api/user_from_database.dart';

class UserDataApi {
  static Future<UserFromDatabase> getData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => UserFromDatabase.fromMap(value.data()));
  }
}
