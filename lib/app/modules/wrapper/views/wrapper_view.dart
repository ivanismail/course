import 'package:course/app/modules/wrapper/controllers/wrapper_controller.dart';
import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class WrapperView extends StatefulWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  _WrapperViewState createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {
  final WrapperController controller = Get.find<WrapperController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage[controller.tabIndex.value]),
      bottomNavigationBar: GetBuilder<WrapperController>(
        init: WrapperController(),
        initState: (_) {},
        builder: (_) {
          return CircleNavBar(
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     MyColor.purple(),
            //     MyColor.purpleLight(),
            //   ],
            // ),
            activeIcons: [
              Icon(Icons.home, color: MyColor.purple()),
              Icon(Icons.receipt, color: MyColor.purple()),
              Icon(Icons.card_travel, color: MyColor.purple()),
              Icon(Icons.favorite, color: MyColor.purple()),
              Icon(Icons.person, color: MyColor.purple()),
            ],
            inactiveIcons: [
              Icon(Icons.home, color: MyColor.netral6()),
              Icon(Icons.receipt, color: MyColor.netral6()),
              Icon(Icons.card_travel, color: MyColor.netral6()),
              Icon(Icons.favorite, color: MyColor.netral6()),
              Icon(Icons.person, color: MyColor.netral6()),
            ],
            color: Colors.white,
            height: 60,
            circleWidth: 60,
            initIndex: this.controller.tabIndex.value,
            onChanged: (v) {
              controller.tabIndex.value = v;
              // controller.tabController!.animateTo(v);
              // controller.currentPage(v);
            },
            // tabCurve: ,
            // padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              // bottomRight: Radius.circular(24),
              // bottomLeft: Radius.circular(24),
            ),
            shadowColor: MyColor.purple(),
            elevation: 10,
          );
        },
      ),
    );
  }
}
