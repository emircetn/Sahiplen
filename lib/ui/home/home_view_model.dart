import 'package:flutter/material.dart';
import 'package:sahiplen/core/base/modelview/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  int? page;
  late PageController pageController;

  HomeViewModel(this.page);

  @override
  void init() {
    page = page ?? 0;
    pageController = PageController(initialPage: page!);
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void updateNavbarIndex(int index) {
    page = index;
    pageController.jumpToPage(index);
    setState();
  }
}
