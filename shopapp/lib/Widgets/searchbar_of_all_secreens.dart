import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/category_model.dart';
import '../Providers/category_prov.dart';
import '../Secreens/Search_Bage.dart';

class Search_Bar_of_All_Secreens extends StatefulWidget {
  List<CategoriesModel> products_list=[];
   Search_Bar_of_All_Secreens({super.key});

  @override
  State<Search_Bar_of_All_Secreens> createState() =>
      _Search_Bar_of_All_SecreensState();
}

class _Search_Bar_of_All_SecreensState
    extends State<Search_Bar_of_All_Secreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        children: [
          Container(
              width: 294,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff909090).withOpacity(0.3)),
              child: Row(
                children: [
                IconButton(onPressed: (){
                  showSearch(context: context, delegate: DataSearch(list_products: [
                    CategoriesModel(id:'id',
                        image_url:' image_url',
                        cate_name: 'cate_name')
                  ]
                  ));
                },
                   icon:  Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xff909090),
                    )),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Search Food",
                    style: TextStyle(
                        color: Color(0xff909090),
                        fontSize: 19,

                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          SizedBox(width: 19,),
          Container(
            width: 61,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff909090).withOpacity(0.3)
            ),
            child:InkWell(
              child: Image.asset("images/Group 236.png"),
              onTap: (){},
            )
          )
        ],
      ),
    );
  }
}
