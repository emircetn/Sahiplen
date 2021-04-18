import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../extensions/app_extensions.dart';

class SpecialTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final bool? saveAttempted;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? errorText;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;

  const SpecialTextFormField({
    Key? key,
    required this.labelText,
    required this.validator,
    this.onSaved,
    this.saveAttempted = false,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.errorText,
    this.suffix,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextFormField(
        autovalidateMode: saveAttempted! ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        maxLines: maxLines,
        maxLength: maxLength,
        minLines: 1,
        initialValue: initialValue,
        decoration: InputDecoration(
          prefix: prefix,
          suffix: suffix,
          labelText: labelText,
          labelStyle: context.textTheme.subtitle2!.copyWith(color: Colors.black54),
          border: OutlineInputBorder(borderRadius: context.borderRadiusNormal),
          isDense: true,
          suffixIcon: suffixIcon,
          errorText: errorText,
        ),
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        key: key,
      ),
    );
  }
}
