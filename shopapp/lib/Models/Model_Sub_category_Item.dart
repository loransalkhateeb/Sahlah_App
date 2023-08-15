import 'package:shopapp/Models/Model_Items.dart';

class Category_Item {
  var id;
  var image_url;
  var title_item;
  var description;
  var price;

  Category_Item(
      {required this.id,
      required this.price,
      required this.image_url,
      required this.description,
      required this.title_item});

  factory Category_Item.fromJson(var json) {
    return Category_Item(
        id: json['id'],
        price: json['price'],
        image_url: json['image_url'],
        description: json['description'],
        title_item: json['title_item']);
  }
}
