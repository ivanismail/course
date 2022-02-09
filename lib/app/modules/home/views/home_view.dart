import 'package:course/app/modules/home/controllers/home_controller.dart';
import 'package:course/app/themes/colors.dart';
import 'package:course/app/widgets/label_text.dart';
import 'package:course/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              AppBarHome(),
              LabelText(title: 'Hello Ivan'),
              LabelText(title: 'Find what you want'),
              SizedBox(height: 12),
              ListCategory(),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(title: 'Best Seller'),
                    LabelText(
                      title: 'View All',
                      size: 20,
                      color: MyColor.purple(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              ListProduct()
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String? name;
  final double? heigth;
  final Color? color;
  final Color? colorSecond;
  const Category({
    Key? key,
    this.name,
    this.heigth,
    this.color,
    this.colorSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2 - 14,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: this.color ?? MyColor.purple(),
              gradient: LinearGradient(colors: [
                this.color ?? MyColor.purple(),
                this.colorSecond ?? MyColor.purpleLight(),
              ]),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: this.heigth ?? 50,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    this.name.toString(),
                    style: TextStyle(
                      color: MyColor.netral1(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Category(
                name: 'Mobile Developer',
                color: MyColor.purpleLight(),
                colorSecond: MyColor.purple(),
                heigth: 100,
              ),
              Category(
                name: 'UI/UX Design',
                color: MyColor.green(),
                heigth: 40,
              ),
            ],
          ),
          Column(
            children: [
              Category(
                name: 'Web Developer',
                color: MyColor.pink(),
                heigth: 40,
              ),
              Category(
                name: 'System Analyst',
                color: MyColor.blue(),
                heigth: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12),
            child: SvgPicture.asset(
              'assets/menu.svg',
              color: MyColor.netral9(),
              height: 30,
              width: 30,
            ),
          ),
          ClipRRect(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColor.purple(),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/search.svg',
                  color: MyColor.netral1(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ProductCard(
                  name: 'Website Design & Development',
                  ratting: 4,
                  totalReview: 95,
                ),
                SizedBox(height: 24),
              ],
            );
          }),
    );
  }
}
