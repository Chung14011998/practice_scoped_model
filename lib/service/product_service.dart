import 'dart:convert';
import 'package:design_ui_simple/model/product_respository.dart';
import 'package:http/http.dart' as http;

class ProductService{
  //fetch data from api
  Future<ProductResponse> fetchProductData() async {
    String url = "http://m23sa1.izysync.com/rest/V1/mobileapi/home";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data=json.decode(response.body);

      // If the call to the server was successful, parse the JSON.
      return ProductResponse.fromJson(data[1]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}