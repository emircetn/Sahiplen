import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

class PageLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFoldingCube(
      color: context.theme.primaryColor,
      size: 30,
    ));
  }
}
