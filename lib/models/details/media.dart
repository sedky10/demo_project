import 'package:demo_project/models/details/images.dart';

class Media {
  late List<Images> images;

  Media({required this.images});

  Media.FromJson(Map<String, dynamic> map) {
    this.images = [];
    (map['images']).forEach((element) {
      this.images.add(Images.FromJson(element));
    });
  }

  Map<String, dynamic> toJson() {
    List<Map> list = [];
    this.images.forEach((element) => list.add(element.toJson()));
    Map<String, dynamic> map = {
      "images": list,
    };
    return map;
  }
}
