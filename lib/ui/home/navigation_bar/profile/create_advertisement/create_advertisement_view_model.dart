import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/components/widgets/picker/image_picker_modal_sheet.dart';
import 'package:sahiplen/core/constants/router_constants.dart';
import 'package:sahiplen/ui/home/navigation_bar/profile/create_advertisement/adversitement_model.dart';

class CreateAdvertisementViewModel extends BaseViewModel {
  late AdversitementModel adversitementModel;
  File? advertisementImage;
  late GlobalKey<FormState> formKey;
  List<String> petList = ['Kedi', 'Köpek', 'Muhabbet Kuşu', 'Papağan', 'Hamster'];
  String? selectedPet;
  @override
  void init() {
    formKey = GlobalKey<FormState>();
    adversitementModel = AdversitementModel();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> pushLocationSelectorPage() async {
    await navigationService.pushNamed(RouteConstant.LOCATION_SELECTOR_PAGE_ROUTE, arguments: (city, district, quarter) {
      adversitementModel.cityName = city;
      adversitementModel.districtName = district;
      adversitementModel.quarterName = quarter;
    });
    setState();
  }

  String? headerValidator(String? header) {
    if (header == null) {
      return 'Lütfen ilan başlığı girin';
    } else if (header.length <= 50) {
      return 'İlan başlığı en fazla 50 karakter olabilir';
    } else {
      return null;
    }
  }

  String? explanationValidator(String? explanation) {
    if (explanation == null) {
      return 'Lütfen ilan açıklaması girin';
    } else if (explanation.length <= 150) {
      return 'İilan açıklaması en fazla 150 karakter olabilir';
    } else {
      return null;
    }
  }

  void dropDownOnChanged(String? value) {
    selectedPet = value;
    setState();
  }

  Future<void> addPetPicture() async {
    advertisementImage = await ImagePickerModelSheet.instance.addPhoto(advertisementImage, context, 0);
    setState();
  }
}
