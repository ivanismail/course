import 'package:course/app/modules/favorite/views/favorite_view.dart';
import 'package:course/app/modules/home/views/home_view.dart';
import 'package:course/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  TabController? tabController;
  final tabIndex = 2.obs;
  var page;

  List<Widget> get currentPage => [
        HomeView(),
        ProfileView(),
        FavoriteView(),
        ProfileView(),
        FavoriteView(),
      ];
}
