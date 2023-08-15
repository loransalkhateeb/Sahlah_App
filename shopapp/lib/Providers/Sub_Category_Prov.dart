import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopapp/Const_Values.dart';

import '../Models/Sun_category_Model.dart';

import 'package:http/http.dart'as http;

class Sub_Category_Prov extends ChangeNotifier{
  List<Sub_Model> list_sub_cat=[];
  getsubcategory()async{

    final response=await http.get(Uri.parse("${Const_Values.baseurl}select_sub_categories.php"));
    if(response.statusCode==200){
      list_sub_cat=[];
      var jsonbody=jsonDecode(response.body);
      var sub_cats=jsonbody['sub_categories'];
      for(Map i in sub_cats){
        list_sub_cat.add(
          Sub_Model(image_url: i['image_url'],
              price: i['price'], name: i['name'], id: i['id'])
        );
      }
    }
    notifyListeners();
  }
}