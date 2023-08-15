import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Providers/offers_provider.dart';
import '../Widgets/banner_offer_widget.dart';

class List_Offers_View extends StatefulWidget {
  const List_Offers_View({super.key});

  @override
  State<List_Offers_View> createState() => _List_Offers_ViewState();
}

class _List_Offers_ViewState extends State<List_Offers_View> {

  @override
  void initState() {
    Provider.of<Offers_Prov>(context, listen: false).getoffers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Consumer<Offers_Prov>(
      builder: (context, value, child) {
        return ListView.separated(
          itemCount: value.list_offer.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Banner_Offer_Widget(
              percentage_offer: value.list_offer[index].percentage_offer,
              image_url: value.list_offer[index].image_url,
              image: 'images/5a35e097637df0.5152847915134803434075.png',
              offer_title: value.list_offer[index].offer_title,
            );
          },  separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 17,
          );
        },
        );
      },
    );
  }
}
