import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Sub_Category_Prov.dart';
import '../Secreens/Cat_Sub_Item_Secreen.dart';
import '../Widgets/Sub_Category_Widget.dart';

class List_Sub_Category extends StatefulWidget {
  const List_Sub_Category({super.key});

  @override
  State<List_Sub_Category> createState() => _List_Sub_CategoryState();
}

class _List_Sub_CategoryState extends State<List_Sub_Category> {
  @override
  void initState() {
    Provider.of<Sub_Category_Prov>(context, listen: false).getsubcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Sub_Category_Prov>(
      builder: (context, value, child) {
        return ListView.separated(
          itemCount: value.list_sub_cat.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Sun_Category_Widget(
              imge_url: value.list_sub_cat[index].image_url,
              name: value.list_sub_cat[index].name,
              price: value.list_sub_cat[index].price.toString(),
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return cat_Sub_item_Secreen(
                        id_sub_items: value.list_sub_cat[index].id,
                      );
                    },
                  ),
                );
              },
              id: value.list_sub_cat[index].id,
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
