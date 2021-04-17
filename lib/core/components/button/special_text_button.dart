import 'package:flutter/material.dart';
import '../../extensions/app_extensions.dart';

class SpecialTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  @override
  const SpecialTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: context.borderRadiusLow,
          ))),
          onPressed: onPressed,
          key: key,
          child: Text(text, style: context.textTheme.bodyText1!.copyWith(color: Colors.black))),
    );
  }
}
