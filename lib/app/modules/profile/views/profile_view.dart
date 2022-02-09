import 'package:course/app/themes/colors.dart';
import 'package:course/app/widgets/label_text.dart';
import 'package:course/app/widgets/list_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: Get.width,
                    height: 400,
                    color: MyColor.purple(),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 75,
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/FOTO.jpeg'),
                        ),
                      ),
                      SizedBox(height: 12),
                      LabelText(title: 'Ivan Ismail'),
                      LabelText(
                        title: 'ivanismail2@gmail.com',
                        color: MyColor.netral7(),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 12),
                ListTileCard(
                  title: 'My Profile',
                  svg: 'user',
                ),
                ListTileCard(
                  title: 'My Address',
                  svg: 'map-marker',
                ),
                ListTileCard(
                  title: 'Notifications',
                  svg: 'bell',
                ),
                ListTileCard(
                  title: 'Settings',
                  svg: 'settings',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 3, size.height / 3, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
