import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AvatarApi {
  static Future<void> avatarToStorage(File avatar) async {
    await FirebaseStorage.instance
        .ref('${FirebaseAuth.instance.currentUser.uid}/avatar')
        .putFile(avatar);
  }

  static Future<String> avatarFromStorage() async {
    try {
      return await FirebaseStorage.instance
          .ref('${FirebaseAuth.instance.currentUser.uid}/avatar')
          .getDownloadURL();
    } catch (e) {}
  }
}
