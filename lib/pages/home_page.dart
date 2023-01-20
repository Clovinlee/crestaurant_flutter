import 'package:cflutter4/component/food_card.dart';
import 'package:cflutter4/component/grid_hotmenu.dart';
import 'package:cflutter4/component/hot_promo_card.dart';
import 'package:cflutter4/component/search_bar.dart';
import 'package:cflutter4/controllers/FoodController.dart';
import 'package:cflutter4/data.dart';
import 'package:cflutter4/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      color: AppConstant.black1,
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontFamily: "Montserrat"),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SearchBar(),
            const SizedBox(height: 15),
            Text(
              "Today's Deal",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 150,
              child: NotificationListener<OverscrollNotification>(
                onNotification: (notification) =>
                    notification.metrics.axisDirection != AxisDirection.down,
                child: hotPromoMenu(),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Hot Menu's",
              style: Theme.of(context).textTheme.headline2,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 450) {
                  return GridHotMenu(grid: 4);
                } else {
                  return GridHotMenu(grid: 2);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView hotPromoMenu() {
    return ListView.separated(
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idx) {
          return HotPromoCard(
              title: todayPromo[idx]["title"].toString(),
              description: todayPromo[idx]["description"].toString(),
              price: int.parse(todayPromo[idx]["price"].toString()),
              discounted: int.parse(todayPromo[idx]["discounted"].toString()),
              image: todayPromo[idx]["image"].toString());
        },
        separatorBuilder: (context, idx) {
          return const SizedBox(width: 15);
        },
        itemCount: todayPromo.length);
  }
}
