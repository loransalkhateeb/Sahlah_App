class CategoriesModel {
  var id;
  var image_url;
  var  cate_name;

  CategoriesModel({
    required this.id,
    required this.image_url,
    required this.cate_name,
  });

  factory CategoriesModel.fromJson(var json) {
    return CategoriesModel(
      id: json['id'],
      image_url: json['image_url'],
      cate_name: json['cate_name'],
    );
  }
}