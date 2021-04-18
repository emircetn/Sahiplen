import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahiplen/core/constants/router_constants.dart';
import 'package:sahiplen/core/navigation/navigation_service.dart';

class ImageUpdateAvatar extends StatelessWidget {
  final File? fileImage;
  final String? networkImage;
  final Function()? updateButtonOnTap;

  const ImageUpdateAvatar({Key? key, this.fileImage, this.networkImage, this.updateButtonOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (fileImage != null) {
          await NavigationService.instance.pushNamed(RouteConstant.SHOW_IMAGE_PAGE_ROUTE, arguments: fileImage);
        } else if (networkImage != null) {
          await NavigationService.instance.pushNamed(RouteConstant.SHOW_IMAGE_PAGE_ROUTE, arguments: networkImage);
        }
      },
      child: CircleAvatar(
        radius: 60.h,
        backgroundImage: fileImage != null
            ? FileImage(fileImage!)
            : networkImage != null
                ? NetworkImage(networkImage!) as ImageProvider<Object>?
                : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (fileImage == null && networkImage == null) ...[
              CircleAvatar(
                radius: 40.h,
                backgroundColor: Colors.white12,
                child: Icon(Icons.add_a_photo, color: Colors.white54),
              )
            ],
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.9),
                child: IconButton(
                  icon: Icon(Icons.cached),
                  onPressed: updateButtonOnTap,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
