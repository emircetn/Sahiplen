import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../extensions/app_extensions.dart';

class AuthTextFormField extends StatelessWidget {
  final String labelText;
  final Function(String)? validator;
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
  final List<TextInputFormatter>? inputFormatters;

  const AuthTextFormField({
    Key? key,
    required this.labelText,
    this.validator,
    this.onSaved,
    this.saveAttempted,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.errorText,
    this.suffix,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: saveAttempted! ? AutovalidateMode.always : AutovalidateMode.disabled,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefix: prefix,
        suffix: suffix,
        labelText: labelText,
        labelStyle: context.textTheme.subtitle2!.copyWith(color: Colors.black54),
        contentPadding: context.paddingLowBottom,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator as String? Function(String?)?,
      key: key,
    );
  }
}
