import 'package:flutter/material.dart';
import '../../extensions/app_extensions.dart';

class SpecialButton extends StatelessWidget {
  final bool? isLoading;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgorundColor;
  final Color textColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Widget? buttonIcon;
  final bool border;
  final BorderRadius? borderRadius;
  final double height;
  @override
  const SpecialButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgorundColor,
    this.buttonIcon,
    this.border = false,
    this.borderColor,
    this.textStyle,
    this.borderRadius,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Container(
        height: height,
        width: context.width,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                backgorundColor ?? context.theme.primaryColor,
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: border && borderColor == null // borderColor geçilirse onun rengi , geçilmezse Theme.
                    ? BorderSide(color: context.theme.primaryColor)
                    : borderColor != null
                        ? BorderSide(color: borderColor!)
                        : BorderSide(color: Colors.transparent),
                borderRadius: borderRadius != null ? borderRadius! : context.borderRadiusNormal,
              ))),
          // disabledColor: context.theme.primaryColor.withOpacity(0.9),
          onPressed: isLoading! ? null : onPressed,
          key: key,
          child: isLoading!
              ? Container(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonIcon == null
                        ? Container()
                        : Container(
                            height: 20,
                            width: 20,
                            child: buttonIcon,
                          ),
                    Text(text,
                        style: textStyle == null ? context.textTheme.bodyText1!.copyWith(color: textColor) : textStyle!.copyWith(color: textColor)),
                    Container()
                  ],
                ),
        ),
      ),
    );
  }
}
