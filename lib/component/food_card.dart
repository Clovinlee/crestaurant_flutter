import 'package:cflutter4/pages/detail_food.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:intl/intl.dart';

import 'package:cflutter4/models/food_model.dart';

class FoodCard extends StatelessWidget {
  final double imgWidth;
  final double imgHeight;
  final BorderRadius defaultBorderRadius;
  final Food food;

  const FoodCard({
    Key? key,
    required this.imgWidth,
    required this.imgHeight,
    required this.defaultBorderRadius,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double distance = 35;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: distance),
          child: Material(
            color: AppConstant.black3,
            borderRadius: defaultBorderRadius,
            elevation: 8,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: InkWell(
                onTap: () {
                  openDetailFood(context, food);
                },
                borderRadius: defaultBorderRadius,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontFamily: "Montserrat"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: imgHeight - 40,
                          color: Colors.transparent,
                        ),
                        Text(
                          food.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          food.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Rp${NumberFormat('#,###,000').format(double.parse(food.price.toString()))}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: distance - 20),
            child: GestureDetector(
              onTap: () {
                openDetailFood(context, food);
              },
              child: Hero(
                tag: food.title,
                child: Image.asset(
                  "assets/images/${food.image}",
                  height: imgHeight,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

openDetailFood(BuildContext context, Food food) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailFood(
        food: food,
      ),
    ),
  );
}
