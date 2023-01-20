import 'package:cflutter4/component/food_card.dart';
import 'package:cflutter4/component/grid_menu.dart';
import 'package:cflutter4/component/search_bar.dart';
import 'package:cflutter4/controllers/FoodController.dart';
import 'package:cflutter4/data.dart';
import 'package:cflutter4/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      color: AppConstant.black1,
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white, fontFamily: "Montserrat"),
        child: ListView(
          children: [
            const SearchBar(),
            const SizedBox(height: 15),
            Text(
              "Menu List",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 15),
            const CategoryChip(),
            const SizedBox(height: 8),
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

class CategoryChip extends StatefulWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  State<CategoryChip> createState() => CategoryChipState();
}

class CategoryChipState extends State<CategoryChip> {
  static int? categorySelected;
  static List<String> filters = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              return Container(
                margin: EdgeInsets.only(
                    right: idx == foodCategories.length - 1 ? 0 : 10),
                child: FilterChip(
                  backgroundColor: Colors.white54,
                  selectedColor: AppConstant.lightOrange,
                  selected: filters.contains(foodCategories[idx]),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        filters.add(foodCategories[idx]);
                      } else {
                        filters.removeWhere(
                            (element) => element == foodCategories[idx]);
                      }
                    });
                  },
                  label: Text(
                    foodCategories[idx],
                    style: TextStyle(
                        color: AppConstant.black3,
                        fontWeight: idx == categorySelected
                            ? FontWeight.w600
                            : FontWeight.w500),
                  ),
                ),
              );
            }, childCount: foodCategories.length),
          ),
        ],
      ),
    );
  }
}
