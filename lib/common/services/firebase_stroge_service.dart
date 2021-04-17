import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStrogeService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadProfilePhotoToDatabase(
    String userID,
    File? photoFile,
  ) async {
    try {
      if (photoFile != null) {
        var _storageReference = _firebaseStorage.ref().child('profilePhotos').child(userID).child('profilePhoto.png');
        await _storageReference.putFile(photoFile);
        var url = await _storageReference.getDownloadURL();
        return url;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> uploadAdvertisementPhotoToDatabase(String advertisementID, File advertisementImage, int photoNumber) async {
    try {
      var _storageReference = _firebaseStorage.ref().child('advertisement').child(advertisementID).child('advertisement$photoNumber.png');
      await _storageReference.putFile(advertisementImage);
      var url = await _storageReference.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
