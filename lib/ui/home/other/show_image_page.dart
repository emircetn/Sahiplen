import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

class ShowImagePage extends StatelessWidget {
  final String? networkImageUrl;
  final File? fileImage;

  ShowImagePage({this.networkImageUrl, this.fileImage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
            width: context.width,
            color: Colors.grey[900],
            height: double.maxFinite,
            child: Center(
                child: networkImageUrl != null
                    ? Hero(tag: networkImageUrl!, child: Image.network(networkImageUrl!))
                    : Hero(tag: fileImage!, child: Image.file(fileImage!)))),
      ),
    );
  }
}
