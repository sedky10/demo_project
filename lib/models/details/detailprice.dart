import 'detailcurrent.dart';

class DetailPrice{
  late List<DetailCurrent> current;

  DetailPrice({required this.current});

  DetailPrice.fromJson(Map<String, dynamic> map) {
    this.current = [];
    (map["current"])
        .forEach((element) => this.current.add(DetailCurrent.FromJson(element)));
  }

  Map<String, dynamic> toJson() {
    List<Map> list = [];
    this.current.forEach((element) => list.add(element.toJson()));
    Map<String, dynamic> map = {
      "current": list,
    };
    return map;
  }
}