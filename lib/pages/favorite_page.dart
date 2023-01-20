import 'package:cflutter4/component/food_card.dart';
import 'package:cflutter4/component/grid_hotmenu.dart';
import 'package:cflutter4/component/grid_menu.dart';
import 'package:cflutter4/controllers/FoodController.dart';
// import 'package:cflutter4/models/Food.dart';
import 'package:cflutter4/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController controller = Get.find();
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      color: AppConstant.black1,
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontFamily: "Montserrat"),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            Text(
              "Favorite Menu List",
              style: Theme.of(context).textTheme.headline2,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 450) {
                  return GridMenu(grid: 4);
                } else {
                  return GridMenu(grid: 2);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

generateFoodGrid(int grid) {
  FoodController fc = Get.find();
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
    itemCount: fc.foodList.length,
    itemBuilder: (BuildContext context, int idx) {
      const double imgWidth = 170;
      const double imgHeight = 140;
      BorderRadius defaultBorderRadius = BorderRadius.circular(10);

      return FoodCard(
        imgWidth: imgWidth,
        imgHeight: imgHeight,
        defaultBorderRadius: defaultBorderRadius,
        food: Food.fromJson(fc.foodList[idx]),
      );
    },
  );
}
