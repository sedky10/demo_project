import 'package:demo_project/models/product%20list/products.dart';

class MainModel {
  late String categoryName;
  late int itemCount ;
  late List<Products> products;

  MainModel({
    required this.categoryName,
    required this.itemCount,
    required this.products,
  });

  MainModel.FromJson(Map<String, dynamic> map) {

    this.categoryName = map["categoryName"];

    this.itemCount = map["itemCount"];
    print('-----18----');
    this.products = [];
    // print(map['products']);
    (map["products"])
        .forEach((element) => this.products.add(Products.FromJson(element)));
    print('-----13----');

   }

  Map<String, dynamic> toJson() {
    List<Map> list = [];
    this.products.forEach((element) => list.add(element.toJson()));
    Map<String, dynamic> map = {
      "categoryName": this.categoryName,
      "itemCount": this.itemCount,
      "products": list,
    };
    return map;
  }
}
