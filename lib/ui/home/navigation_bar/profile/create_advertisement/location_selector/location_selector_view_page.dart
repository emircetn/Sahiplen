import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';
import 'package:sahiplen/core/extensions/app_extensions.dart';

class LocationSelectorViewModel extends BaseViewModel {
  late List<String> cityList, districtList;
  late List<dynamic> quarterList;
  Map? cityMapList;
  int? pageState;
  bool? isLoadingLocation, isLoadingInitialize;
  String? cityName, districtName, quarterName;
  late final Function(String, String, String?)? onCallBack;

  LocationSelectorViewModel(this.onCallBack);
  @override
  void init() {
    cityList = [];
    districtList = [];
    quarterList = [];
    pageState = 0;
    isLoadingLocation = false;
    isLoadingInitialize = true;
    getCity();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> getCity() async {
    if (cityList.isEmpty) {
      cityList.clear();
      var citys = await rootBundle.loadString(assetContants.textPath + 'location_turkey'.toJSON);

      cityMapList = json.decode(citys);
      cityMapList!.forEach((city, list) {
        cityList.add(city);
      });
      isLoadingInitialize = false;
      setState();
    }
  }

  void pageStateUpdate(int i) {
    pageState = i;
    setState();
  }

  void getDistinctUpdate() {
    if (cityName == null) {
      showToast('Lütfen bir şehir seç');
    } else {
      pageState = 2;
      getDistrict();
      setState();
    }
  }

  void getQuarterUpdate() {
    if (districtName == null) {
      showToast('Lütfen bir ilçe seç');
    } else {
      pageState = 3;
      getQuarter();
      setState();
    }
  }

  void getDistrict() {
    districtList.clear();
    cityMapList![cityName].forEach((district, quarter) {
      districtList.add(district);
    });
  }

  void getQuarter() {
    quarterList.clear();
    quarterList.addAll(cityMapList![cityName][districtName]);
  }

  bool onWillPop() {
    pageState = 0;
    setState();
    return false;
  }

  void backButtonOnPressed() {
    pageState = 0;
    setState();
  }

  void citySelectOnTap(int index) {
    cityName = cityList[index];
    pageState = 0;
    districtName = null;
    quarterName = null;
    setState();
  }

  void districtSelectOnTap(int index) {
    districtName = districtList[index];
    quarterName = null;
    pageState = 0;
    setState();
  }

  void quarterSelectOnTap(int index) {
    quarterName = quarterList[index];
    pageState = 0;
    setState();
  }

  Future<void> buttonOnPressed() async {
    if ((cityName != null) && (districtName != null) && (quarterName != null || quarterList.isEmpty)) {
      onCallBack!(districtName!, cityName!, quarterName);
      await navigationService.pop();
    } else {
      showToast('Lütfen gerekli kısımları doldur');
    }
  }
}
