import 'package:sahiplen/common/model/app_user.dart';
import 'package:sahiplen/common/services/firebase_auth_service.dart';
import 'package:sahiplen/common/services/firebase_firestore_service.dart';
import 'package:sahiplen/get_it.dart';

class AppRepository {
  final FirebaseAuthService? _firebaseAuthService = getIt<FirebaseAuthService>();
  final FirebaseFirestoreService? _firebaseFirestoreService = getIt<FirebaseFirestoreService>();
  AppUser? appUser;

  //////////////////////////////auth///////////////////////////////

  Future<void> currentUser() async {
    var appUserFB = _firebaseAuthService!.getCurrentUser();
    if (appUserFB != null) {
      var appUserDB = await readUserFromDatabase(appUserFB.userID!);
      if (appUserDB != null) {
        appUser = appUserDB;
      }
    }
  }

  Future<bool> registerWithMail(AppUser user, String password) async {
    var userDB = await _firebaseAuthService!.registerWithMail(user.email!, password);
    if (userDB != null) {
      user.userID = userDB.userID;
      userDB = await _firebaseFirestoreService!.saveUserToDatabase(user);
      if (userDB != null) {
        appUser = userDB;
        return true;
      }
    }
    return false;
  }

  Future<bool> loginWithMail(String email, String password) async {
    AppUser? result = await _firebaseAuthService!.loginWithMail(email, password);
    if (result != null) {
      result = await readUserFromDatabase(result.userID!);
    }
    if (result != null) {
      appUser = result;
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    appUser = null;
    await _firebaseAuthService!.signOut();
  }

  //////////////////////////////firestore///////////////////////////////

  Future<bool> saveUserToDatabase(AppUser appUser) async {
    return await _firebaseFirestoreService!.saveUserToDatabase(appUser);
  }

  Future<AppUser?> readUserFromDatabase(String userID) async {
    return await _firebaseFirestoreService!.readUserFromDatabase(userID);
  }

  //////////////////////////validator///////////////////////////////////

  String? displayNameCheck(String? displayName) {
    if (displayName == null) {
      return 'Lütfen Ad ve Soyad girin';
    } else if (!displayName.contains(' ')) {
      return 'Ad ve Soyadı boşluk ile ayırılmalı';
    } else if (displayName.split(' ')[0].length < 2) {
      return 'İsim en az 2 harf olabilir';
    } else if (displayName.split(' ')[1].length < 2) {
      return 'Soyisim en az 2 harf olabilir';
    } else if (!RegExp(r'^([a-zA-ZğüşıöçĞÜŞİÖÇ ])').hasMatch(displayName)) {
      return 'Ad ve Soyad özel karakter içeremez';
    } else if (displayName.length > 25) {
      return 'Ad ve Soyad uzunluğu en fazla 25 olabilir';
    } else {
      return null;
    }
  }

  String? emailCheck(String? email) {
    if (email == null) {
      return 'Lütfen e-posta adresi gir';
    }
    if (RegExp(r'^(\S+@\S+\.\S+$)').hasMatch(email)) {
      return null;
    }
    return 'E-posta adresi geçersiz';
  }

  String? passwordCheck(String? password) {
    if (password == null || password.isEmpty) {
      return 'Lütfen bir parola gir';
    } else if (password.contains(' ')) {
      return 'Parola boşluk içeremez';
    } else if (password.length < 6) {
      return 'Parola en az 6 karakter olabilir';
    } else if (password.length > 25) {
      return 'Parola en fazla 25 karakter olabilir';
    } else {
      return null;
    }
  }
}
