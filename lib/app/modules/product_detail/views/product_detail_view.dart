import 'package:course/app/themes/colors.dart';
import 'package:course/app/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(height: 40),
            AppBarDetail(),
            SizedBox(height: 12),
            GetBuilder<ProductDetailController>(
              init: ProductDetailController(),
              initState: (_) {},
              builder: (_) {
                return Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: MyColor.netral1(),
                        ),
                        height: Get.height / 2,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: Get.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/webdev.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width - 150,
                              padding: EdgeInsets.all(10),
                              child: LabelText(
                                title: 'Mobile App Design & Development',
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 110,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColor.blue(),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    'assets/star.svg',
                                    color: MyColor.netral1(),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    color: MyColor.netral1(),
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              '99 Reviews',
                              style: TextStyle(
                                color: MyColor.netral1(),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            SizedBox(height: 12),
            DetailContent(),
            SizedBox(height: 12),
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 90,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColor.pink(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/comments.svg',
                        color: MyColor.netral1(),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: MyClipperCustom(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColor.purple(),
                    ),
                    height: Get.height / 8,
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 100,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LabelText(
                                    title: 'Price',
                                    color: MyColor.netral3(),
                                    size: 22,
                                  ),
                                  LabelText(
                                    title: 'Rp.99.000,-',
                                    color: MyColor.netral1(),
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 110,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: MyColor.netral4(),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: LabelText(
                                    title: 'Buy',
                                    color: MyColor.netral1(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColor.netral1(),
              ),
              child: IconButton(
                color: MyColor.netral9(),
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          LabelText(title: 'Details'),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColor.netral1(),
              ),
              child: Container(
                padding: EdgeInsets.all(6),
                child: SvgPicture.asset(
                  'assets/heart.svg',
                  color: MyColor.pink(),
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipperButton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width - (size.width - 65), 0);

    path.lineTo(
        size.width - (size.width - 65), size.height - (size.height - 65));
    path.lineTo(0, size.height - (size.height - 65));

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.08896797);
    path.cubicTo(0, size.height * 0.07243221, 0, size.height * 0.06416423,
        size.width * 0.001731056, size.height * 0.05728897);
    path.cubicTo(
        size.width * 0.008839775,
        size.height * 0.02905480,
        size.width * 0.03677658,
        size.height * 0.006983737,
        size.width * 0.07251441,
        size.height * 0.001367596);
    path.cubicTo(size.width * 0.08121689, 0, size.width * 0.09168221, 0,
        size.width * 0.1126126, 0);
    path.lineTo(size.width * 0.8873874, 0);
    path.cubicTo(size.width * 0.9083176, 0, size.width * 0.9187838, 0,
        size.width * 0.9274865, size.height * 0.001367596);
    path.cubicTo(
        size.width * 0.9632230,
        size.height * 0.006983737,
        size.width * 0.9911599,
        size.height * 0.02905480,
        size.width * 0.9982680,
        size.height * 0.05728897);
    path.cubicTo(size.width, size.height * 0.06416423, size.width,
        size.height * 0.07243221, size.width, size.height * 0.08896797);
    path.lineTo(size.width, size.height * 0.6886121);
    path.cubicTo(
        size.width,
        size.height * 0.7051477,
        size.width,
        size.height * 0.7134164,
        size.width * 0.9982680,
        size.height * 0.7202918);
    path.cubicTo(
        size.width * 0.9911599,
        size.height * 0.7485249,
        size.width * 0.9632230,
        size.height * 0.7705961,
        size.width * 0.9274865,
        size.height * 0.7762117);
    path.cubicTo(
        size.width * 0.9187838,
        size.height * 0.7775801,
        size.width * 0.9083176,
        size.height * 0.7775801,
        size.width * 0.8873874,
        size.height * 0.7775801);
    path.lineTo(size.width * 0.7804054, size.height * 0.7775801);
    path.cubicTo(
        size.width * 0.7594752,
        size.height * 0.7775801,
        size.width * 0.7490090,
        size.height * 0.7775801,
        size.width * 0.7403063,
        size.height * 0.7789484);
    path.cubicTo(
        size.width * 0.7045698,
        size.height * 0.7845641,
        size.width * 0.6766329,
        size.height * 0.8066352,
        size.width * 0.6695248,
        size.height * 0.8348683);
    path.cubicTo(
        size.width * 0.6677928,
        size.height * 0.8417438,
        size.width * 0.6677928,
        size.height * 0.8500125,
        size.width * 0.6677928,
        size.height * 0.8665480);
    path.lineTo(size.width * 0.6677928, size.height * 0.9110320);
    path.cubicTo(
        size.width * 0.6677928,
        size.height * 0.9275676,
        size.width * 0.6677928,
        size.height * 0.9358363,
        size.width * 0.6660608,
        size.height * 0.9427117);
    path.cubicTo(
        size.width * 0.6589527,
        size.height * 0.9709448,
        size.width * 0.6310158,
        size.height * 0.9930160,
        size.width * 0.5952793,
        size.height * 0.9986317);
    path.cubicTo(size.width * 0.5865766, size.height, size.width * 0.5761104,
        size.height, size.width * 0.5551802, size.height);
    path.lineTo(size.width * 0.1126126, size.height);
    path.cubicTo(size.width * 0.09168221, size.height, size.width * 0.08121689,
        size.height, size.width * 0.07251441, size.height * 0.9986317);
    path.cubicTo(
        size.width * 0.03677658,
        size.height * 0.9930160,
        size.width * 0.008839775,
        size.height * 0.9709448,
        size.width * 0.001731056,
        size.height * 0.9427117);
    path.cubicTo(0, size.height * 0.9358363, 0, size.height * 0.9275676, 0,
        size.height * 0.9110320);
    path.lineTo(0, size.height * 0.08896797);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyClipperCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.2067416, size.height * 0.6373239);
    path.cubicTo(
        size.width * 0.2377685,
        size.height * 0.6373239,
        size.width * 0.2629213,
        size.height * 0.5585007,
        size.width * 0.2629213,
        size.height * 0.4612676);
    path.lineTo(size.width * 0.2629213, size.height * 0.1760563);
    path.cubicTo(size.width * 0.2629213, size.height * 0.07882324,
        size.width * 0.2880742, 0, size.width * 0.3191011, 0);
    path.lineTo(size.width * 0.9438202, 0);
    path.cubicTo(size.width * 0.9748472, 0, size.width,
        size.height * 0.07882324, size.width, size.height * 0.1760563);
    path.lineTo(size.width, size.height * 0.8239437);
    path.cubicTo(size.width, size.height * 0.9211761, size.width * 0.9748472,
        size.height, size.width * 0.9438202, size.height);
    path.lineTo(size.width * 0.05617978, size.height);
    path.cubicTo(size.width * 0.02515258, size.height, 0,
        size.height * 0.9211761, 0, size.height * 0.8239437);
    path.lineTo(0, size.height * 0.8133803);
    path.cubicTo(
        0,
        size.height * 0.7161479,
        size.width * 0.02515258,
        size.height * 0.6373239,
        size.width * 0.05617978,
        size.height * 0.6373239);
    path.lineTo(size.width * 0.2067416, size.height * 0.6373239);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3001184, size.height * 0.3339633);
    path_0.cubicTo(size.width * 0.2860483, size.height * 0.07692242,
        size.width * 0.1387261, size.height * 0.01741043, 0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.9964413);
    path_0.cubicTo(
        size.width,
        size.height * 1.030249,
        size.width * 0.9050411,
        size.height * 0.7803025,
        size.width * 0.7796014,
        size.height * 0.6900854);
    path_0.cubicTo(
        size.width * 0.7530797,
        size.height * 0.6710107,
        size.width * 0.3177029,
        size.height * 0.6552633,
        size.width * 0.3001184,
        size.height * 0.3339633);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffCC0000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(
          title:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s. Dummy text of the printing and typesetting industry.',
          size: 18,
          color: MyColor.netral7(),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.netral1(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/video.svg',
                        color: MyColor.blue(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(
                        title: 'Total Video',
                        size: 16,
                      ),
                      LabelText(
                        title: '20 Videos',
                        size: 16,
                        color: MyColor.netral7(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.netral1(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/clock.svg',
                        color: MyColor.blue(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        title: 'Delivery Time',
                        size: 16,
                      ),
                      LabelText(
                        title: '20 Days',
                        size: 16,
                        color: MyColor.netral7(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
