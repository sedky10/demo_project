class Brand {
  late int brandId;
  late String name;

  Brand({
    required this.brandId,
    required this.name,
  });

  Brand.FromJson(Map<String, dynamic> map) {
    this.brandId = map["brandId"];
    this.name = map["name"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "brandId": this.brandId,
      "name": this.name,
    };
    return map;
  }
}
