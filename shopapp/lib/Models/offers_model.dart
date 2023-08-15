class Offers_Model {
  var id;
  var percentage_offer;
  var offer_title;
  var image_url;

  Offers_Model(
      {required this.id,
      required this.percentage_offer,
      required this.image_url,
      required this.offer_title,
    });

  factory Offers_Model.fromJson(var json) {
    return Offers_Model(
        id: json['id'],
        percentage_offer: json['percentage_offer'],
        image_url: json['image_url'],
        offer_title: json['offer_title'],
      );
  }
}
