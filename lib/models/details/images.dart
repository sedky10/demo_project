class Images {
  late String url;
  late String type;
  late String colour;

  Images({
    required this.url,
    required this.type,
    required this.colour,
  });

  Images.FromJson(Map<String, dynamic> map) {
    this.url = map["url"];
    this.type = map["type"];
    this.colour = map["colour"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "url": this.url,
      "type": this.type,
      "colour": this.colour,
    };
    return map;
  }
}
