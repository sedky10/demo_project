class Current {
  late int value;

  Current({required this.value});

  Current.FromJson(Map<String, dynamic> map) {
    this.value = map["value"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "value": this.value,
    };
    return map;
  }
}
