import 'package:get/get.dart';

import 'package:course/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:course/app/modules/favorite/views/favorite_view.dart';
import 'package:course/app/modules/home/bindings/home_binding.dart';
import 'package:course/app/modules/home/views/home_view.dart';
import 'package:course/app/modules/product_detail/bindings/product_detail_binding.dart';
import 'package:course/app/modules/product_detail/views/product_detail_view.dart';
import 'package:course/app/modules/profile/bindings/profile_binding.dart';
import 'package:course/app/modules/profile/views/profile_view.dart';
import 'package:course/app/modules/wrapper/bindings/wrapper_binding.dart';
import 'package:course/app/modules/wrapper/views/wrapper_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WRAPPER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WRAPPER,
      page: () => WrapperView(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
  ];
}
