import 'package:cflutter4/models/food_model.dart';
import 'package:cflutter4/pages/detail_food.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:intl/intl.dart';

class HotPromoCard extends StatelessWidget {
  const HotPromoCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.price,
      required this.discounted,
      required this.image})
      : super(key: key);
  final String title;
  final String description;
  final int price;
  final int discounted;
  final String image;
  @override
  Widget build(BuildContext context) {
    const double imgWidth = 170;
    const double imgHeight = 180;
    BorderRadius defaultBorderRadius = BorderRadius.circular(10);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Material(
            elevation: 8,
            borderRadius: defaultBorderRadius,
            color: AppConstant.black3,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: InkWell(
                onTap: () {
                   Food f = Food(id: 99, title: title, description: description, price: this.discounted.toDouble(), image: image, category: [{"food_id":1,"category_id":1,"category":{"id":1,"title":"Eastern","created_at":"2022-08-26T08:21:22.000000Z","updated_at":"2022-08-26T08:21:22.000000Z"}},{"food_id":1,"category_id":2,"category":{"id":2,"title":"Western","created_at":"2022-08-26T08:21:22.000000Z","updated_at":"2022-08-26T08:21:22.000000Z"}}], imageThumbnail: [image]);
                  openDetailFood(context, f);
                },
                borderRadius: defaultBorderRadius,
                child: Container(
                  width: 380,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const SizedBox(
                        //image base
                        width: imgWidth,
                        height: imgHeight - 75,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rp${NumberFormat('#,###,000').format(int.parse(discounted.toString()))}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Rp${NumberFormat('#,###,000').format(int.parse(price.toString()))}",
                                  style: const TextStyle(
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/images/$image",
              width: imgWidth,
              height: imgHeight,
            ),
          ),
        ),
      ],
    );
  }
}

openDetailFood(BuildContext context, Food f) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailFood(food: f,),
    ),
  );
}