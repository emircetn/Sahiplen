import 'package:flutter/material.dart';
import 'package:sahiplen/core/components/button/special_button.dart';
import 'package:sahiplen/core/components/textformfield/auth_text_form_field.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';
import 'package:sahiplen/core/base/view/base_view.dart';
import 'package:sahiplen/ui/auth/register/register_view_model.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) {
        return Scaffold(
          backgroundColor: context.theme.primaryColor,
          body: body(context, viewModel),
        );
      },
    );
  }

  SafeArea body(BuildContext context, RegisterViewModel viewModel) {
    return SafeArea(
      child: Center(
        child: Container(
          height: context.height * .9,
          decoration: BoxDecoration(borderRadius: context.borderRadiusMedium, color: Colors.white),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: context.mediumValue),
                helloTextField(context),
                fromField(viewModel, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding helloTextField(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHighTop,
      child: Text(
        'KAYIT OL',
        style: context.textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    );
  }

  Form fromField(RegisterViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          SizedBox(height: context.mediumValue),
          AuthTextFormField(
            labelText: 'Adın Soyadın',
            saveAttempted: viewModel.saveAttempted,
            keyboardType: TextInputType.text,
            onSaved: (_displayName) => viewModel.displayName = _displayName,
            validator: (_displayName) => viewModel.appRepository.displayNameCheck(_displayName),
          ),
          AuthTextFormField(
            labelText: 'E-Posta',
            saveAttempted: viewModel.saveAttempted,
            keyboardType: TextInputType.emailAddress,
            onSaved: (_email) => viewModel.email = _email,
            validator: (_email) => viewModel.appRepository.emailCheck(_email),
          ),
          AuthTextFormField(
            labelText: 'Parola',
            saveAttempted: viewModel.saveAttempted,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: viewModel.obscure,
            onSaved: (_password) => viewModel.password = _password,
            validator: (_password) => viewModel.appRepository.passwordCheck(_password),
            suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye_rounded, color: viewModel.obscure ? Colors.grey : context.theme.primaryColor),
              onPressed: () => viewModel.obscureUpdate(),
            ),
          ),
          SpecialButton(
            text: 'Kayıt Ol',
            isLoading: viewModel.isLoading,
            onPressed: () async => await viewModel.registerWithMail(),
          ),
        ],
      ),
    );
  }
}
