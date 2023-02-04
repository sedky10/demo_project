import 'package:demo_project/models/details/brand.dart';
import 'package:demo_project/models/details/media.dart';
import 'package:demo_project/models/details/variants.dart';
import 'package:demo_project/models/product%20list/price.dart';

class Details {
  late int id;
  late String name;
  late String description;
  late String gender;
  late String productCode;
  late List<Brand> brand;
  late bool isInStock;
  late List<Variants> variants;
  late List<Media> media;
  late List<Price> price;

  Details({
    required this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.productCode,
    required this.brand,
    required this.isInStock,
    required this.variants,
    required this.media,
    required this.price,
  });

  Details.FromJson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
    this.description = map["description"];
    this.gender = map["gender"];
    this.productCode = map["productCode"];
    this.brand = [];

    // (map["brand"])
    //     .forEach((element) => this.brand.add(Brand.FromJson(element)));
    this.isInStock = map["isInStock"];

    this.variants = [];
    (map["variants"])
        .forEach((element) => this.variants.add(Variants.fromjson(element)));

    this.media = [];
    // (map["media"])
    //     .forEach((element) => this.media.add(Media.FromJson(element)));
    print('-----1-1--');
    this.price = [];
    // (map["price"])
    //     .forEach((element) => this.price.add(Price.fromJson(element)));
    print('-----1-1--1');
  }

  Map<String, dynamic> toJson() {
    List<Map> list1 = [];
    this.brand.forEach((element) => list1.add(element.toJson()));
    List<Map> list2 = [];
    this.variants.forEach((element) => list2.add(element.toJson()));
    List<Map> list3 = [];
    this.media.forEach((element) => list3.add(element.toJson()));
    List<Map> list4 = [];
    this.price.forEach((element) => list4.add(element.toJson()));
    Map<String, dynamic> map = {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "gender": this.gender,
      "productCode": this.productCode,
      "brand": list1,
      "isInStock": this.isInStock,
      "variants": list2,
      "media": list3,
      "price": list4,
    };
    return map;
  }
}
