import 'package:course/app/themes/colors.dart';
import 'package:flutter/material.dart';

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
