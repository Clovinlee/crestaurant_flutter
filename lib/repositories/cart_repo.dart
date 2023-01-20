import 'package:cflutter4/api/ApiClient.dart';
import 'package:cflutter4/constants.dart';
import 'package:get/get.dart';

class CartRepo extends GetxService {
  final ApiClient apiClient;
  CartRepo({required this.apiClient});

  Future<Response> getAllCart() async {
    try {
      return await apiClient.getData(AppConstant.CART_URI);
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }

  Future<Response> getCart(int id) async {
    try {
      return await apiClient.getData("${AppConstant.CART_URI}/$id");
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }

  storeCart(String json) {}
}
