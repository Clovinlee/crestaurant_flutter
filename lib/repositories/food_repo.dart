import 'package:cflutter4/api/ApiClient.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class FoodRepo extends GetxService {
  final ApiClient apiClient;
  FoodRepo({required this.apiClient});

  Future<Response> getAllFood() async {
    try {
      return await apiClient.getData(AppConstant.FOOD_URI);
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }

  Future<Response> getHotFood() async {
    try {
      return await apiClient.getData(AppConstant.HOTFOOD_URI);
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }

  Future<Response> getFood(int id) async {
    try {
      return await apiClient.getData("${AppConstant.FOOD_URI}/$id");
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }
}
