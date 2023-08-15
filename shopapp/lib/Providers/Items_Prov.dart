import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shopapp/Const_Values.dart';

import '../Models/Model_Items.dart';

class Items_Prove extends ChangeNotifier {
  List<Model_Items> list_items = [];

  getitems({required var id_categories}) async {
    final response = await http.post(
        Uri.parse("${Const_Values.baseurl}select2_items.php"),
        body: {"id_categories": id_categories});
    if (response.statusCode == 200) {
      list_items = [];
      var jsonbody = jsonDecode(response.body);
      var items = jsonbody['items'];
      for (Map i in items) {
        list_items.add(Model_Items(
            price: i['price'],
            image_url: i['image_url'],
            kind: i['kind'],
            name_cat: i['name_cat'],
            id: i['id']));
      }
    }
    notifyListeners();
  }
}
