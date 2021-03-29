import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String photoURL;
  // final List notification;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  User({
    this.uid,
    this.name,
    this.surname,
    this.phone,
    this.email,
    this.photoURL,
    this.createdAt,
    this.updatedAt,
  });

  User.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        name = map['name'],
        surname = map['surname'],
        phone = map['phone'],
        email = map['email'],
        photoURL = map['photoURL'],
        updatedAt = map['updatedAt'],
        createdAt = map['createdAt'];

  User copyWith({
    String name,
    String surname,
    String phone,
    String email,
    String photoURL,
    Timestamp createdAt,
    Timestamp updatedAt,
  }) =>
      User(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        photoURL: photoURL ?? this.photoURL,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );
}
