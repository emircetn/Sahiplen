import 'package:sahiplen/common/model/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/adversitement_model.dart';

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

  Future<bool> publishAdversitement(AdversitementModel adversitementModel) async {
    try {
      await _firebaseFirestore.collection('adversitement').doc(adversitementModel.adversitementID).set(adversitementModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<AdversitementModel>?>? getUserAdversitement(String userID) async {
    try {
      List<AdversitementModel>? adversitementList = [];
      var querySnapshot = await _firebaseFirestore.collection('adversitement').get();
      /*       var querySnapshot = await _firebaseFirestore.collection('adversitement').where('userID', isEqualTo: 'userID').get();
 */
      for (var documentSnapshot in querySnapshot.docs) {
        var adversitementModel = AdversitementModel.fromMap(documentSnapshot.data());
        adversitementList.add(adversitementModel);
      }
      return adversitementList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AdversitementModel?>? getAdversitement(String adversitementID) async {
    try {
      var documentSnapshot = await _firebaseFirestore.collection('adversitement').doc(adversitementID).get();
      if (documentSnapshot.data() != null) {
        var adversitementModel = AdversitementModel.fromMap(documentSnapshot.data()!);
        adversitementModel.user = await getUser(adversitementModel.userID!);
        return adversitementModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<AppUser?> getUser(String userID) async {
    try {
      var documentSnapshot = await _firebaseFirestore.collection('users').doc(userID).get();
      if (documentSnapshot.data() != null) {
        return AppUser.fromMap(documentSnapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
