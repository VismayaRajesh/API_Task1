import 'dart:convert';

import 'package:api_task/model/ProductResp.dart';
import 'package:http/http.dart' as http;
class Apiservice{
  final baseurl = "https://fakestoreapi.com";

  Future<List<ProductResp>> getAllproducts() async {
    var response = await http.get(Uri.parse("$baseurl/products/"));
    try{
      if(response.statusCode >= 200 && response.statusCode <= 299){
        var jsonn = jsonDecode(response.body) as List;
        return jsonn.map((item) => ProductResp.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    }catch(e){
      throw Exception('Error fetching products: $e');
    }
    }
}