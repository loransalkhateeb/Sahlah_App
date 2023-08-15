import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Models/Sun_category_Model.dart';
import 'package:shopapp/Providers/Sub_Category_Prov.dart';
import 'package:shopapp/Widgets/banner_offer_widget.dart';

import '../Providers/category_prov.dart';
import '../Providers/offers_provider.dart';
import 'Sub_Category_Widget.dart';
import 'cat_widgets.dart';

class List_View_category extends StatefulWidget {
  const List_View_category({super.key});

  @override
  State<List_View_category> createState() => _List_View_categoryState();
}

class _List_View_categoryState extends State<List_View_category> {
  var width;
  var height;

  @override
  void initState() {
    Provider.of<CategoriesProv>(context, listen: false).getcategories();
    Provider.of<Offers_Prov>(context, listen: false).getoffers();
    Provider.of<Sub_Category_Prov>(context, listen: false).getsubcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: width,
          height: height * 0.9,
          child: Consumer<CategoriesProv>(
            builder: (context, value, child) {
              return ListView.separated(
                itemCount: value.list_categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Cat_Widgets(
                    icon: value.list_categories[index].image_url,
                    name: value.list_categories[index].cate_name,
                    ontap: () {
                      print("Cars_Images");
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
          ),
        ),
        Container(
          width: width,
          height: 15,
          child: Consumer<Offers_Prov>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.list_offer.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Banner_Offer_Widget(
                    percentage_offer: value.list_offer[index].percentage_offer,
                    image_url: value.list_offer[index].image_url,
                    image: 'images/Promo Advertising.png',
                    offer_title: value.list_offer[index].offer_title,
                  );
                },
              );
            },
          ),
        ),
        Container(
          width: width,
          height: height * 0.3,
          child: Consumer<Sub_Category_Prov>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.list_sub_cat.length,
                // scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Sun_Category_Widget(
                      imge_url: value.list_sub_cat[index].image_url,
                      name: value.list_sub_cat[index].name,
                      price: value.list_sub_cat[index].price.toString(),
                  ontap: (){
                        print("Lorans_Alkhateeb");
                  }, id: value.list_sub_cat[index].id,
                  );
                },
              );
            },
          ),
        )
      ],
    ));
  }
}
