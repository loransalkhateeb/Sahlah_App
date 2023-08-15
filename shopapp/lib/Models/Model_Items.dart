import 'package:flutter/foundation.dart';

class Model_Items {
  var id;
  var image_url;
  var name_cat;
  var kind;
  var price;

  Model_Items(
      {required this.id,
      required this.price,
      required this.image_url,
      required this.kind,
      required this.name_cat});

  factory Model_Items.fromJson(var json) {
    return Model_Items(
        id: json['id'],
        price: json['price'],
        image_url: json['image_url'],
        kind: json['kind'],
        name_cat: json['name_cat']);
  }
}
