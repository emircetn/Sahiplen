import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahiplen/common/model/app_user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser? getCurrentUser() {
    return _firebaseAuth.currentUser == null ? null : _firebaseUserToAppUser(_firebaseAuth.currentUser!);
  }

  Future loginWithMail(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return _firebaseUserToAppUser(userCredential.user!);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future registerWithMail(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return _firebaseUserToAppUser(userCredential.user!);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }

  AppUser _firebaseUserToAppUser(User firebaseUser) {
    return AppUser(userID: firebaseUser.uid, email: firebaseUser.email);
  }
}
