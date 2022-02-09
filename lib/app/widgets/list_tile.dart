import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileCard extends StatelessWidget {
  final String? title;
  final String? svg;
  final double? fontSize;
  const ListTileCard({
    Key? key,
    this.title,
    this.svg,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColor.netral1(),
          ),
          child: ListTile(
            title: Text(
              this.title ?? '',
              style: TextStyle(
                color: MyColor.netral8(),
                fontSize: this.fontSize ?? 16,
              ),
            ),
            trailing: Icon(Icons.chevron_right_sharp),
            leading: SvgPicture.asset('assets/$svg.svg'),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
