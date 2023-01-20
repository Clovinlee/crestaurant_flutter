import 'package:cflutter4/api/ApiClient.dart';
import 'package:cflutter4/constants.dart';
import 'package:cflutter4/controllers/CartController.dart';
import 'package:cflutter4/controllers/FoodController.dart';
import 'package:cflutter4/repositories/cart_repo.dart';
import 'package:cflutter4/repositories/food_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.put(ApiClient(appBaseUrl: AppConstant.API_URL));

  Get.put(FoodRepo(apiClient: Get.find()));

  Get.put(FoodController(foodRepo: Get.find()));

  Get.put(CartRepo(apiClient: Get.find()));

  Get.put(CartController(cartRepo: Get.find()));
}
