import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/List_Views/List_View_Items.dart';

import '../List_Views/List_View_Category.dart';
import '../List_Views/List_View_Sub_Category.dart';
import '../List_Views/Offers_List_View.dart';
import '../Widgets/App_Barof_All_secreens.dart';
import '../Widgets/List_View_Categories.dart';
import '../Widgets/Widget_Special_Offer.dart';
import '../Widgets/searchbar_of_all_secreens.dart';

class Main_Enduser_Serceen extends StatefulWidget {
  const Main_Enduser_Serceen({super.key});

  @override
  State<Main_Enduser_Serceen> createState() => _Main_Enduser_SerceenState();
}

class _Main_Enduser_SerceenState extends State<Main_Enduser_Serceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const AppBar_of_All_Secreens(
            title: 'Deliver to',
            name: 'El-Galaa.st Thani,Assiut',
            imageasset: 'images/Group 346.png',
            imageasset2: 'images/place.png',
          ),
          Search_Bar_of_All_Secreens(),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 17, right: 17),
            width: MediaQuery.of(context).size.width,
            height: 3,
            color: const Color(0xffE7E7E7),
          ),
          const Special_Offer(
            text1: 'Special Offers',
            text2: 'See All',
          ),
          SizedBox(
            height: 110,
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: List_View_Category()),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 195,
            child: List_Offers_View(),
          ),
          const Special_Offer(
            text1: 'Top Rated',
            text2: 'See All',
          ),
          const SizedBox(
            height: 160,
            child: List_Sub_Category(),
          ),
          const Special_Offer(
            text1: 'Near to you',
            text2: 'See All',
          ),
          const SizedBox(
            height: 160,
            child: List_Sub_Category(),
          ),
        ],
      ),
    ));
  }
}
