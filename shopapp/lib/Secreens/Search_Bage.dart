import 'package:flutter/material.dart';

import '../Models/category_model.dart';

class DataSearch extends SearchDelegate<String> {
  List<CategoriesModel> list_products = [];

  DataSearch({required this.list_products});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
            size: 30,
            color: Color(0xff909090),
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, top: 30), child: Text("data"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: list_products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                list_products[index].cate_name,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                list_products[index].image_url,
                style: TextStyle(color: Colors.black),
              )
            ],
          );
        });
  }
}
