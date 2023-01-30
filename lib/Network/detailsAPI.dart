import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/details/details.dart';


class DetailsApi {
  Future<Details> GetProductsDetails(int id) async {
    final request = await http.get(
      Uri.https(
        "asos2.p.rapidapi.com",
        "/products//v3/detail",
        {
          'id': '$id',
          'lang': 'en-US',
          'store': 'US',
          'sizeSchema': 'US',
          'currency': 'USD',
        },
      ),
      headers: {
        'X-RapidAPI-Key': '8d3d01b3a5msh8b59f5a4b017291p19be5ajsnaa518c6a3c27',
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
