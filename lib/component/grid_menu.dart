import 'package:cflutter4/component/food_card.dart';
import 'package:cflutter4/controllers/FoodController.dart';
import 'package:cflutter4/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridMenu extends StatelessWidget {
  final int grid;
  const GridMenu({Key? key, required this.grid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController controller = Get.find();
    return FutureBuilder(
      future: controller.getFood(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List listFood = snapshot.data;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: grid,
              mainAxisSpacing: 0,
              crossAxisSpacing: 15,
              childAspectRatio: 1 / 1.8,
            ),
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: listFood.length,
            itemBuilder: (BuildContext context, int idx) {
              const double imgWidth = 170;
              const double imgHeight = 140;
              BorderRadius defaultBorderRadius = BorderRadius.circular(10);

              return FoodCard(
                  imgWidth: imgWidth,
                  imgHeight: imgHeight,
                  defaultBorderRadius: defaultBorderRadius,
                  food: Food.fromJson(listFood[idx]));
            },
          );
        }
        return Text("Wait");
      },
    );
  }
}
