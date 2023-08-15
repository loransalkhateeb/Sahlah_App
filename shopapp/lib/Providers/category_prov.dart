import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopapp/Const_Values.dart';

import '../Models/category_model.dart';

import 'package:http/http.dart' as http;

class CategoriesProv extends ChangeNotifier {
  List<CategoriesModel> list_categories = [];

  getcategories() async {

    final response = await http.get(
      Uri.parse("${Const_Values.baseurl}categories.php"),
    );
    if (response.statusCode == 200) {
      list_categories = [];
      var jsonbody = jsonDecode(response.body);
      var categories = jsonbody['categories'];
      for (Map i in categories) {
        list_categories.add(
          CategoriesModel(id: i['id'],
              image_url: i['image_url'],
              cate_name: i['cate_name'])
        );
      }
    }
    notifyListeners();
  }
}
