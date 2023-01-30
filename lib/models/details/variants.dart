class Variants {
  late int id;
  late String name;
  late int sizeId;
  late String brandSize;
  late String sizeDescription;
  late String displaySizeText;
  late int sizeOrder;
  late bool isInStock;
  late bool isAvailable;
  late String colour;

  Variants({
    required this.id,
    required this.name,
    required this.sizeId,
    required this.brandSize,
    required this.sizeDescription,
    required this.displaySizeText,
    required this.sizeOrder,
    required this.isInStock,
    required this.isAvailable,
  });

  Variants.fromjson(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
    this.sizeId = map["sizeId"];
    this.brandSize = map["brandSize"];
    this.sizeDescription = map["sizeDescription"];
    this.displaySizeText = map["displaySizeText"];
    this.sizeOrder = map["sizeOrder"];
    this.isInStock = map["isInStock"];
    this.isAvailable = map["isAvailable"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": this.id,
      "name": this.name,
      "sizeId": this.sizeId,
      "brandSize": this.brandSize,
      "sizeDescription": this.sizeDescription,
      "displaySizeText": this.displaySizeText,
      "sizeOrder": this.sizeOrder,
      "isInStock": this.isInStock,
      "isAvailable": this.isAvailable,
    };
    return map;
  }
}
