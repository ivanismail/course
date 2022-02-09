import 'package:course/app/themes/colors.dart';
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
            GetBuilder<ProductDetailController>(
              init: ProductDetailController(),
              initState: (_) {},
              builder: (_) {
                return ClipPath(
                  clipper: MyClipperButton(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColor.purple(),
                    ),
                    height: Get.height / 10,
                    width: Get.width,
                  ),
                );
              },
            ),
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
    double r = 40;
    double b = 120;
    double h = size.height;
    double w = size.width;

    var path = Path();
    path.lineTo(0, h - r); //kiri atas ke bawah
    path.quadraticBezierTo(0, h, r, h);

    path.lineTo(w - (b + r), h);
    path.quadraticBezierTo(w - b, h, w - b, h - r);

    path.lineTo(w - b, h - b);
    // path.quadraticBezierTo(
    //   w,
    //   h - b,
    //   w,
    //   h - b,
    // );

    path.lineTo(w - r, h - b);
    path.quadraticBezierTo(
      w - r,
      h - r,
      w,
      h - b - r,
    );

    path.lineTo(w, 0);
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
