import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';

class CreateAdvertisementViewModel extends BaseViewModel {
  String? advertisementHeader;
  String? advertisementExplanation;
  late GlobalKey<FormState> formKey;

  @override
  void init() {
    formKey = GlobalKey<FormState>();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
