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
                onTap: () {},
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
