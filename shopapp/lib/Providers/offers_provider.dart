import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopapp/Const_Values.dart';

import '../Models/offers_model.dart';

import 'package:http/http.dart' as http;

class Offers_Prov extends ChangeNotifier {
  List<Offers_Model> list_offer = [];

  getoffers() async {
    final response = await http
        .get(Uri.parse("${Const_Values.baseurl}select_banner_offer.php"));
    if (response.statusCode == 200) {
      list_offer = [];
      var jsonbody = jsonDecode(response.body);
      var banners = jsonbody['Offers'];
      for (Map i in banners) {
        list_offer.add(Offers_Model(
            id: i['id'],
            image_url: i['image_url'],
            offer_title: i['offer_title'],
            percentage_offer: i['percentage_offer'],
        ));
      }
    }
    notifyListeners();
  }
}
