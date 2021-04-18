import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../extensions/app_extensions.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerModelSheet {
  static ImagePickerModelSheet instance = ImagePickerModelSheet._init();
  ImagePickerModelSheet._init();

  ImagePicker picker = ImagePicker();

  Future<File?> addTeamPhoto(File? profileImage, BuildContext context, int type) async {
    //0 profile(square),
    //1 normal
    if (Platform.isAndroid) {
      await showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: context.borderRadiusOnlyTopNormal,
          ),
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(
                        Icons.camera,
                        color: context.theme.primaryColor,
                      ),
                      title: Text('Kameradan Çek', style: context.textTheme.subtitle1),
                      onTap: () async {
                        profileImage = await getCamera(context, type);
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.image,
                        color: context.theme.primaryColor,
                      ),
                      title: Text('Galeriden Seç', style: context.textTheme.subtitle1),
                      onTap: () async {
                        profileImage = await getGallery(context, type);
                      }),
                  if (profileImage != null) ...[
                    ListTile(
                        leading: Icon(
                          Icons.delete,
                          color: context.theme.primaryColor,
                        ),
                        title: Text(
                          'Profil Fotoğrafını Kaldır',
                          style: context.textTheme.subtitle1,
                        ),
                        onTap: () {
                          profileImage = removeImage(context);
                        }),
                  ]
                ],
              ),
            );
          });
    } else {
      await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                profileImage = await getGallery(context, type);
              },
              child: const Text('Galeriden Seç'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                profileImage = await getCamera(context, type);
              },
              child: const Text('Kameradan Çek'),
            ),
            if (profileImage != null) ...[
              CupertinoActionSheetAction(
                onPressed: () async {
                  profileImage = removeImage(context);
                },
                child: const Text(
                  'Profil Fotoğrafını Kaldır',
                ),
              )
            ]
          ],
        ),
      );
    }

    return profileImage;
  }

  Future<File?> getCamera(context, type) async {
    final _picture = await picker.getImage(source: ImageSource.camera, maxWidth: 1500, maxHeight: 1500, imageQuality: 25);
    if (_picture != null) {
      var profileImage = await cropImage(_picture, type);
      Navigator.of(context).pop();
      return profileImage;
    }
    Navigator.of(context).pop();

    return null;
  }

  Future<File?> getGallery(context, type) async {
    final _picture = await picker.getImage(source: ImageSource.gallery, maxWidth: 1500, maxHeight: 1500, imageQuality: 25);
    if (_picture != null) {
      var profileImage = await cropImage(_picture, type);
      Navigator.of(context).pop();
      return profileImage;
    }
    Navigator.of(context).pop();

    return null;
  }

  File? removeImage(context) {
    Navigator.of(context).pop();
    return null;
  }

  Future<File?> cropImage(PickedFile? pickedFile, int type) async {
    File? _picture;
    if (pickedFile == null) return null;
    _picture = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: type == 0
            ? [CropAspectRatioPreset.square]
            : type == 1
                ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.ratio16x9, CropAspectRatioPreset.ratio4x3]
                : [
                    CropAspectRatioPreset.square,
                    CropAspectRatioPreset.original,
                    CropAspectRatioPreset.ratio3x2,
                    CropAspectRatioPreset.ratio16x9,
                    CropAspectRatioPreset.ratio4x3
                  ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Kırp',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          // initAspectRatio: CropAspectRatioPreset.square,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    return _picture;
  }
}
