import 'package:course/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TabController? tabController;
  int tabIndex = 0;

  void currentPage() {
    if (this.tabIndex == 0) {
      HomeView();
    } else {
      HomeView();
    }
  }
}
