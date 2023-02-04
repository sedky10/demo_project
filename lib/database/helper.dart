import 'dbhelper.dart';

class Helper {
  late String image;
  late String name;
  late String size;
  late double price;
  int? id;
  late String color;

  Helper({
    required this.image,
    required this.name,
    required this.price,
    required this.size,
    this.id,
    required this.color,
  });
  Helper.FromMap(Map<String,dynamic> map){
    if (map[ColumnId] != null) {
      this.id = map[ColumnId];
    }
    this.name = map[ColumnName];
    this.image = map[Columnimage];
    this.size = map[Columnsize];
    this.price = map[Columnprice];
    this.color = map[Columncolor];
  }
  Map<String, dynamic> tomap() {
    Map<String, dynamic> map = {};
    if (this.id != null) {
      map[ColumnId] = this.id;
    }
    map[ColumnName] = this.name;
    map[Columnsize] = this.size;
    map[Columnimage] = this.image;
    map[Columnprice] = this.price;
    map[Columncolor] = this.color;
    return map;
  }
}
