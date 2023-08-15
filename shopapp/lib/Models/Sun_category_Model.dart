class Sub_Model {
  var id;
  var image_url;
  var name;
  var price;

  Sub_Model({required this.id,required this.image_url, required this.price, required this.name});

  factory Sub_Model.fromJson(var json) {
    return Sub_Model(
        image_url: json['image_url'], price: json['price'], name: json['name'], id: json['id']);
  }
}
