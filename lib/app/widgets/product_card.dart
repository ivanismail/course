import 'package:course/app/routes/app_pages.dart';
import 'package:course/app/themes/colors.dart';
import 'package:course/app/widgets/ratting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
