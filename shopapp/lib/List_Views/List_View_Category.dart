import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Items_Prov.dart';
import 'package:shopapp/Secreens/Item_Secreen.dart';

import '../Providers/category_prov.dart';
import '../Widgets/cat_widgets.dart';
import 'List_View_Items.dart';

class List_View_Category extends StatefulWidget {
  var id_cat;

  List_View_Category({super.key, this.id_cat});

  @override
  State<List_View_Category> createState() => _List_View_CategoryState();
}

class _List_View_CategoryState extends State<List_View_Category> {
  @override
  void initState() {
    Provider.of<CategoriesProv>(context, listen: false).getcategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProv>(
      builder: (context, value, child) {
        return ListView.separated(
          itemCount: value.list_categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Cat_Widgets(
              icon: value.list_categories[index].image_url,
              name: value.list_categories[index].cate_name,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Item_Secreen(id_cat:
                      value.list_categories[index].id
                      );
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 22,
            );
          },
        );
      },
    );
  }
}
