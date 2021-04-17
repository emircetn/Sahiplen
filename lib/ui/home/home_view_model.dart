import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  late int page;
  late PageController pageController;

  @override
  void init() {
    page = 0;
    pageController = PageController();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

/*   void onPageChanged(int page) {
    this.page = page;
  } */

  void updateNavbarIndex(int index) {
    page = index;
    pageController.jumpToPage(index);
    setState();
  }
}
