// ignore_for_file: file_names

import 'dart:convert';

import 'package:cflutter4/repositories/food_repo.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  FoodRepo foodRepo;

  FoodController({required this.foodRepo});

  List _foodList = [];
  List _hotFoodList = [];

  List get foodList {
    return _foodList;
  }

  Future<List> getFood({int id = -1}) async {
    Response r;
    if (id == -1) {
      r = await foodRepo.getAllFood();
    } else {
      r = await foodRepo.getFood(id);
    }
    _foodList = [];
    _foodList = r.body;
    return _foodList;
  }

  Future<List> getHotFood() async {
    Response r;
    r = await foodRepo.getHotFood();

    _hotFoodList = [];
    _hotFoodList = r.body;
    return _hotFoodList;
  }
}
