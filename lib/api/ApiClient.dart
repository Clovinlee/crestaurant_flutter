// ignore_for_file: file_names

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  // ignore: unused_field
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = "";
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "*",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      //baseUrl already defined in constructor
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }
}
