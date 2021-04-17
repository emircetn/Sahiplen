import 'package:sahiplen/common/model/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String userCollection = 'users';

  Future<AppUser?> readUserFromDatabase(String? userID) async {
    try {
      var _documentSnapshot = await _firebaseFirestore.collection(userCollection).doc(userID).get();
      var _userMap = _documentSnapshot.data();
      if (_userMap == null) {
        return null;
      } else {
        return AppUser.fromMap(_userMap);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveUserToDatabase(AppUser appUser) async {
    try {
      await _firebaseFirestore.collection(userCollection).doc(appUser.userID).set(appUser.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
