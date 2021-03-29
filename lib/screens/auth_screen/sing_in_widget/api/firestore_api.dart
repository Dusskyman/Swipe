import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreApi {
  FireStoreApi._();
  static Future<bool> phoneIsRegistred(String phone) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .get()
        .then((QuerySnapshot users) {
      if (users.size == 1) {
        return true;
      }
      return false;
    });
  }
}
