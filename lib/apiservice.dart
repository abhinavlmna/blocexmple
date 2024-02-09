import 'dart:convert';

import 'Products.dart';
import 'package:http/http.dart' as http;

import 'RespMain.dart';

class Apiservice{
  // Apiservice api=Apiservice();
  Future<List<Products>?>fetchdata() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var Json = jsonDecode(response.body);
    var resp = RespMain.fromJson(Json);
    var list = resp.products;
    return list;
  }
}