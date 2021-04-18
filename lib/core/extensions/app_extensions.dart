import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppExtension {}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get freeHeight => height - ScreenUtil().statusBarHeight;
  double get freeHeightWithAppBar => height - ScreenUtil().statusBarHeight - AppBar().preferredSize.height;
  double dynamicHeight(double height) => height * height;
  double dynamicWidth(double width) => width * width;
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension NumberExtension on BuildContext {
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.03;
  double get mediumHighValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMediumHigh => EdgeInsets.all(mediumHighValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingMediumHighVertical => EdgeInsets.symmetric(vertical: mediumHighValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingMediumHighHorizontal => EdgeInsets.symmetric(horizontal: mediumHighValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingLowLeft => EdgeInsets.only(left: lowValue);
  EdgeInsets get paddingNormalLeft => EdgeInsets.only(left: normalValue);
  EdgeInsets get paddingMediumLeft => EdgeInsets.only(left: mediumValue);
  EdgeInsets get paddingMediumHighLeft => EdgeInsets.only(left: mediumHighValue);
  EdgeInsets get paddingHighLeft => EdgeInsets.only(left: highValue);

  EdgeInsets get paddingLowRight => EdgeInsets.only(right: lowValue);
  EdgeInsets get paddingNormalRight => EdgeInsets.only(right: normalValue);
  EdgeInsets get paddingMediumRight => EdgeInsets.only(right: mediumValue);
  EdgeInsets get paddingMediumHighRight => EdgeInsets.only(right: mediumHighValue);
  EdgeInsets get paddingHighRight => EdgeInsets.only(right: highValue);

  EdgeInsets get paddingLowTop => EdgeInsets.only(top: lowValue);
  EdgeInsets get paddingNormalTop => EdgeInsets.only(top: normalValue);
  EdgeInsets get paddingMediumTop => EdgeInsets.only(top: mediumValue);
  EdgeInsets get paddingMediumHighTop => EdgeInsets.only(top: mediumHighValue);
  EdgeInsets get paddingHighTop => EdgeInsets.only(top: highValue);

  EdgeInsets get paddingLowBottom => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get paddingNormalBottom => EdgeInsets.only(bottom: normalValue);
  EdgeInsets get paddingMediumBottom => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get paddingMediumHighBottom => EdgeInsets.only(bottom: mediumHighValue);
  EdgeInsets get paddingHighBottom => EdgeInsets.only(bottom: highValue);
}

extension BorderRadiusExtensionAll on BuildContext {
  BorderRadius get borderRadiusLow => BorderRadius.circular(lowValue);
  BorderRadius get borderRadiusNormal => BorderRadius.circular(normalValue);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(mediumValue);
  BorderRadius get borderRadiusMediumHigh => BorderRadius.circular(mediumHighValue);
  BorderRadius get borderRadiusHigh => BorderRadius.circular(highValue);
}

extension BorderRadiusExtensionOnly on BuildContext {
  BorderRadius get borderRadiusOnlyTopLow => BorderRadius.only(topLeft: Radius.circular(lowValue), topRight: Radius.circular(lowValue));
  BorderRadius get borderRadiusOnlyTopNormal => BorderRadius.only(topLeft: Radius.circular(normalValue), topRight: Radius.circular(normalValue));
  BorderRadius get borderRadiusOnlyTopMedium => BorderRadius.only(topLeft: Radius.circular(mediumValue), topRight: Radius.circular(mediumValue));
  BorderRadius get borderRadiusOnlyTopHigh => BorderRadius.only(topLeft: Radius.circular(highValue), topRight: Radius.circular(highValue));

  BorderRadius get borderRadiusOnlyBottomLow => BorderRadius.only(bottomLeft: Radius.circular(lowValue), bottomRight: Radius.circular(lowValue));
  BorderRadius get borderRadiusOnlyBottomNormal =>
      BorderRadius.only(bottomLeft: Radius.circular(normalValue), bottomRight: Radius.circular(normalValue));
  BorderRadius get borderRadiusOnlyBottomMedium =>
      BorderRadius.only(bottomLeft: Radius.circular(mediumValue), bottomRight: Radius.circular(mediumValue));
  BorderRadius get borderRadiusOnlyBottomHigh => BorderRadius.only(bottomLeft: Radius.circular(highValue), bottomRight: Radius.circular(highValue));

  BorderRadius get borderRadiusOnlyLeftLow => BorderRadius.only(topLeft: Radius.circular(lowValue), bottomLeft: Radius.circular(lowValue));
  BorderRadius get borderRadiusOnlyLeftNormal => BorderRadius.only(topLeft: Radius.circular(normalValue), bottomLeft: Radius.circular(normalValue));
  BorderRadius get borderRadiusOnlyLeftMedium => BorderRadius.only(topLeft: Radius.circular(mediumValue), bottomLeft: Radius.circular(mediumValue));
  BorderRadius get borderRadiusOnlyLeftHigh => BorderRadius.only(topLeft: Radius.circular(highValue), bottomLeft: Radius.circular(highValue));
}

extension ImageExtension on String {
  String get toPNG => '$this.png';
  String get toJSON => '$this.json';
}
