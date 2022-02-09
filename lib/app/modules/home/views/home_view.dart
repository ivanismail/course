import 'package:course/app/modules/home/controllers/home_controller.dart';
import 'package:course/app/routes/app_pages.dart';
import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';

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
              ProductCard(
                name: 'Website Design & Development',
                ratting: 4,
                totalReview: 95,
              ),
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

class LabelText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  const LabelText({
    Key? key,
    required this.title,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        this.title.toString(),
        style: TextStyle(
          fontSize: this.size ?? 30,
          color: this.color ?? MyColor.netral8(),
          fontWeight: FontWeight.bold,
        ),
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
            child: IconButton(
              color: MyColor.netral9(),
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColor.purple(),
              ),
              child: IconButton(
                color: MyColor.netral1(),
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String? name;
  final double? heigth;
  final Color? color;
  final int? totalReview;
  final double? ratting;
  final VoidCallback? onTap;
  const ProductCard({
    Key? key,
    this.name,
    this.heigth,
    this.color,
    this.totalReview,
    this.ratting,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: this.color ?? MyColor.netral1(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width / 2 - 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          child: Image.asset(
                            'assets/webdev.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 6, right: 12, top: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Container(
                              width: Get.width / 2 - 50,
                              child: Text(
                                this.name.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: MyColor.netral9(),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingStars(this.ratting ?? 0),
                              Container(
                                child: Container(
                                  child: Text(
                                    this.totalReview.toString() + ' Review',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: MyColor.netral6(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Rp. 250.000,-',
                            style: TextStyle(
                              color: MyColor.blue(),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final double rate;

  RatingStars(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? Icons.star : Icons.star_outline,
              size: 18,
              color: MyColor.pink(),
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
          ],
    );
  }
}
