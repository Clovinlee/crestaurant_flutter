// ignore_for_file: file_names

import 'package:cflutter4/models/cart_model.dart';
import 'package:cflutter4/repositories/cart_repo.dart';
import 'package:cflutter4/repositories/food_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartRepo cartRepo;

  CartController({required this.cartRepo});

  List _cartList = [];

  List get cartList {
    return _cartList;
  }

  Future<List> getCart({int id = -1}) async {
    Response r;
    if (id == -1) {
      r = await cartRepo.getAllCart();
    } else {
      r = await cartRepo.getCart(id);
    }
    _cartList = [];
    _cartList = r.body;
    return _cartList;
  }

  store(Cart c) {}
}
