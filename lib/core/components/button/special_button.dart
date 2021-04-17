import 'package:flutter/material.dart';
import '../../extensions/app_extensions.dart';

class SpecialButton extends StatelessWidget {
  final bool? isLoading;
  final String buttonText;
  final VoidCallback? buttonOnPressed;
  final Color? buttonColor;
  final Color buttonTextColor;
  final Color? borderColor;
  final TextStyle? buttonTextStyle;
  final Widget? buttonIcon;
  final bool border;
  final BorderRadius? borderRadius;
  final double height;
  @override
  const SpecialButton({
    Key? key,
    required this.buttonText,
    this.isLoading = false,
    required this.buttonOnPressed,
    this.buttonTextColor = Colors.white,
    this.buttonColor,
    this.buttonIcon,
    this.border = false,
    this.borderColor,
    this.buttonTextStyle,
    this.borderRadius,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Container(
        height: height,
        width: context.width,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                buttonColor ?? context.theme.primaryColor,
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
          onPressed: isLoading! ? null : buttonOnPressed,
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
                    Text(buttonText,
                        style: buttonTextStyle == null
                            ? context.textTheme.bodyText1!.copyWith(color: buttonTextColor)
                            : buttonTextStyle!.copyWith(color: buttonTextColor)),
                    Container()
                  ],
                ),
        ),
      ),
    );
  }
}
