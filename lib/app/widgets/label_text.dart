import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;

  const LabelText({
    Key? key,
    required this.title,
    this.color,
    this.size,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        this.title.toString(),
        textAlign: this.textAlign ?? TextAlign.left,
        style: TextStyle(
          fontSize: this.size ?? 30,
          color: this.color ?? MyColor.netral8(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
