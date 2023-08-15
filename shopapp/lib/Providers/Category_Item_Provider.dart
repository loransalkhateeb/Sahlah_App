import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/Const_Values.dart';

import '../Models/Model_Sub_category_Item.dart';


class Category_item_provider extends ChangeNotifier{
  List<Category_Item> list_item_category=[];
  
  getdata({required var id_items}) async{
    final response=await http.post(Uri.parse("${Const_Values.baseurl}get_item_category.php"),
    body: {
      "id_items":id_items
    }
    );
    if(response.statusCode==200){
      list_item_category=[];
      var jsonbody=jsonDecode(response.body);
      var cat_items=jsonbody['item_category'];
      for(Map i in cat_items){
        list_item_category.add(
          Category_Item(id: i['id'],
              price: i['price'],
              image_url: i['image_url'], description: i['description'],
              title_item: i['title_item'])
        );
      }
    }
    notifyListeners();
  }
}