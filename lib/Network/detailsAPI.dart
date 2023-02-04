import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/details/details.dart';


class DetailsApi {
  Future<Details> GetProductsDetails(int id) async {
    final request = await http.get(
      Uri.https(
        "asos2.p.rapidapi.com",
        "/products/v3/detail", 
        {
          'id': '$id',
          'lang': 'en-US',
          'store': 'US',
          'sizeSchema': 'US',
          'currency': 'USD',
        },
      ),
      headers: {
        'X-RapidAPI-Key': 'fcc0eaa4cdmsh0338277ee92f87bp1f904fjsn3b184ce2879f',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com'
      },
    );
    if (request.statusCode >= 200 && request.statusCode <= 299) {
      final Map<String, dynamic> jsonbody = jsonDecode(request.body);
      Details response = Details.FromJson(jsonbody);
      return response;
    } else {
      throw ('failure' + request.body);
    }
  }
}
