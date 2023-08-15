import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/List_Views/list_View_category_Item.dart';

import '../Providers/Category_Item_Provider.dart';
import '../Widgets/App_Barof_All_secreens.dart';

class cat_Sub_item_Secreen extends StatefulWidget {
  var id_sub_items;


   cat_Sub_item_Secreen({super.key,required this.id_sub_items});

  @override
  State<cat_Sub_item_Secreen> createState() => _cat_Sub_item_SecreenState();
}

class _cat_Sub_item_SecreenState extends State<cat_Sub_item_Secreen> {

 @override
  void initState() {
   Provider.of<Category_item_provider>(context, listen: false)
       .getdata(id_items: widget.id_sub_items);
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
                    "This is the sub items secreen",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 600,
                child:List_view_Cate_Item(id_sub_items: widget.id_sub_items,
                )
              ),
            ),


          ],
        ),
      ),
    );
  }
}
