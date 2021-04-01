import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_pj/models/user_api/user.dart';

class UserToDataBase {
  final String uid;
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String photoURL;
  // final List notification;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  UserToDataBase(User user)
      : uid = user.uid,
        name = user.name,
        surname = user.surname,
        phone = user.phone,
        email = user.email,
        photoURL = user.photoURL,
        updatedAt = user.updatedAt,
        createdAt = user.createdAt;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'phone': phone,
      'email': email,
      'photoURL': photoURL,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }
}
