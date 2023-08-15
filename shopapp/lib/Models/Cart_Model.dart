class CartModel {
  var id_items;

  var id;
  var count;
  var image_url;
  var price;
  var name_cat;

  CartModel(
      {required this.id_items,
      required this.id,
      required this.count,
      required this.image_url,
      required this.price,
      required this.name_cat});

  factory CartModel.fromJson(var json) {
    return CartModel(
        id_items: json['id_items'],
        id: json['id'],
        count: json['count'],
        image_url: json['image_url'],
        price: json['price'],
        name_cat: json['name_cat']);
  }
}
