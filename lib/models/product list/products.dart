import 'package:demo_project/models/product%20list/price.dart';

class Products {
  late int id;
  late int productCode;
  late String name;
  late Price price;
  late String colour;
  late String brandName;
  late String imageUrl;

  Products({
    required this.id,
    required this.productCode,
    required this.name,
    required this.price,
    required this.colour,
    required this.brandName,
    required this.imageUrl,
  });

  Products.FromJson(Map<String, dynamic> map) {
    this.id = map["id"];

    this.productCode = map["productCode"];
    this.name = map["name"];

    price = Price.fromJson(map['price']);
    // print('-----11----');
    // (map["price"])
    //     .forEach((element) => this.price.add(Price.fromJson(element)));
    print('-----15----');
    this.colour = map["colour"];
    this.brandName = map["brandName"];
    this.imageUrl = map["imageUrl"];

  }

  Map<String, dynamic> toJson() {
    // List<Map> list = [];
    // this.price.forEach((element) => list.add(element.toJson()));
    Map<String, dynamic> map = {
      "id": this.id,
      "productCode": this.productCode,
      "name": this.name,
      "price": this.price.toJson(),
      "colour": this.colour,
      "brandName": this.brandName,
      "imageUrl": this.imageUrl,
    };
    return map;
  }
}
/*
(map["price"])
        .forEach((element) => this.price.add(Price.fromJson(element)));
 */