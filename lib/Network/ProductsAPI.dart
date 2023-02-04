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
        'X-RapidAPI-Key': 'fcc0eaa4cdmsh0338277ee92f87bp1f904fjsn3b184ce2879f',
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
