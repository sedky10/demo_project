import 'package:demo_project/models/product%20list/current.dart';

class Price {
  late Current current;

  Price({required this.current});

  Price.fromJson(Map<String, dynamic> map) {
    print('-----19----');
    current = Current.FromJson(map['current']);
    // (map["current"])
    //     .forEach((element) => this.current.add(Current.FromJson(element)));
  }

  Map<String, dynamic> toJson() {
    // List<Map> list = [];
    // this.current.forEach((element) => list.add(element.toJson()));
    Map<String, dynamic> map = {
      "current": this.current.toJson(),
    };
    return map;
  }
}
