import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/Const_Values.dart';

import '../Models/Cart_Model.dart';
import '../general.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> listCart = [];
  double totalPrice = 0;

  getCart() async {
    listCart = [];
    final response = await http.post(
      Uri.parse("${Const_Values.baseurl}getCart.php"),
      body: {
        "id_users": await General.getPrefString(Const_Values.id, ""),
      },
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var cart = jsonBody["cart"];
      for (Map i in cart) {
        listCart.add(CartModel.fromJson(i));
      }
    }
    calTotalPrice();
  }

  calTotalPrice() {
    totalPrice = 0;
    for (CartModel cartModel in listCart) {
      totalPrice = totalPrice + (cartModel.count * cartModel.price);
    }
    notifyListeners();
  }

  addToCart({required String idItem}) async {
    await http.post(
      Uri.parse("${Const_Values.baseurl}addcart.php"),
      body: {
        "id_users": await General.getPrefString(Const_Values.id, ""),
        "id_items": idItem,
        "count": "1",
      },
    );
  }

  addToCart2({required String id_sub_item}) async {
    await http.post(
      Uri.parse("${Const_Values.baseurl}addcart.php"),
      body: {
        "id_users": await General.getPrefString(Const_Values.id, ""),
        "id_items": id_sub_item,
        "count": "1",
      },
    );
  }

  updateCart({required String id, required String Count}) async {
    await http.post(
      Uri.parse("${Const_Values.baseurl}updatecart.php"),
      body: {
        "id": id,
        "count": Count,
      },
    );
    calTotalPrice();
  }

  deleteFromCart({required int index}) async {
    await http.post(
      Uri.parse("${Const_Values.baseurl}deletefromcart.php"),
      body: {
        "id": listCart[index].id,
      },
    );
    listCart.removeAt(index);
    calTotalPrice();
  }
}