class DetailCurrent{
  late int value;

  DetailCurrent({required this.value});

  DetailCurrent.FromJson(Map<String, dynamic> map) {
    this.value = map["value"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "value": this.value,
    };
    return map;
  }
}