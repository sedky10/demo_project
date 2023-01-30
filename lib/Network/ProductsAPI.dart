import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product list/mainmodel.dart';

class ProductsAPI {
  Future<MainModel> GetProducts(int id) async{
    final request =await http.get(
      Uri.https(
        "asos2.p.rapidapi.com",
        "/products/v2/list",
        {
          "store": 'US',
          "offset": '0',
          'categoryId': '$id',
          "limit": '48',
          "country": 'US',
          "sort": 'freshness',
          "currency": 'USD',
          "sizeSchema": 'US',
          "lang": 'en-US',
        },
      ),
      headers: {
        'X-RapidAPI-Key': '8d3d01b3a5msh8b59f5a4b017291p19be5ajsnaa518c6a3c27',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      },
    );

    if (request.statusCode >= 200  && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      MainModel response = MainModel.FromJson(jsonbody);
      print('1111');
      return response;
    } else {

      throw ('failure' + request.body);
    }
  }
}
