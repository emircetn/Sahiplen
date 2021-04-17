import 'package:flutter/material.dart';
import 'package:sahiplen/common/model/app_user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

class ProfileAvatar extends StatelessWidget {
  final AppUser appUser;
  const ProfileAvatar({Key? key, required this.appUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appUser.profileUrl == null
        ? CircleAvatar(
            radius: 50.h,
            child: Text(appUser.nameAndSurnameFirstCharacter,
                style: context.textTheme.headline5!.copyWith(
                  color: Colors.white,
                )))
        : CircleAvatar(radius: 50.h, backgroundImage: NetworkImage(appUser.profileUrl!));
  }
}
