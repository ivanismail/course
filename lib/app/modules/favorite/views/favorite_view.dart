import 'package:course/app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ProductCard(
                      name: 'Flutter Mobile Development',
                      ratting: 5,
                      totalReview: 20,
                    ),
                    SizedBox(height: 24)
                  ],
                );
              }),
        ));
  }
}
