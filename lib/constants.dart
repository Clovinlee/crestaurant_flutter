// ignore_for_file: non_constant_identifier_names

import 'package:hexcolor/hexcolor.dart';

class AppConstant {
  static HexColor black1 = HexColor("24292d");
  static HexColor black2 = HexColor("353a40");
  static HexColor black3 = HexColor("191c20");
  static HexColor cardBlackLight = HexColor("303437");
  static HexColor cardBlackDark = HexColor("2a2d32");
  static HexColor lightBlue = HexColor("83d8e6");
  static HexColor lightOrange = HexColor("f4a530");

  static String API_URL = "https://mhs.sib.stts.edu/k4nobar/CRestaurant/crestaurant_api/public/api/";
  // static String API_URL = "http://127.0.0.1:8000/api";
  static String FOOD_URI = "foods";
  static String HOTFOOD_URI = "foods/hot";

  static String CART_URI = "carts";
}
