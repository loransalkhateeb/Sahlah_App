import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Items_Prov.dart';

import '../List_Views/List_View_Items.dart';
import '../Widgets/App_Barof_All_secreens.dart';
import '../Widgets/searchbar_of_all_secreens.dart';

class Item_Secreen extends StatefulWidget {
  var id_cat;

  Item_Secreen({required this.id_cat});

  @override
  State<Item_Secreen> createState() => _Item_SecreenState();
}

class _Item_SecreenState extends State<Item_Secreen> {
  @override
  void initState() {
    Provider.of<Items_Prove>(context, listen: false)
        .getitems(id_categories: widget.id_cat);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const AppBar_of_All_Secreens(
            title: 'Deliver to',
            name: 'El-Galaa.st Thani,Assiut',
            imageasset: 'images/Group 346.png',
            imageasset2: 'images/place.png',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey
                  ),
                  child: IconButton(
                    onPressed: (){Navigator.pop(context);},
                    icon: Icon(Icons.arrow_back_ios_new,size: 20,),
                  ),
                ),
                SizedBox(width: 18,),
                Text(
                  "This is the Items secreen",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 600,
              child: List_View_Items(
                id_category: widget.id_cat,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
