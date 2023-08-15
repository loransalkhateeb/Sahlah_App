import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/category_prov.dart';

import '../Providers/offers_provider.dart';
import '../Widgets/Widget_Offer.dart';
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
    return Consumer2<Offers_Prov, CategoriesProv>(
      builder: (context, offersProvider, categoryProvider, child) {
        return
        ListView.separated(
          itemCount: offersProvider.list_offer.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Widget_Offer(
              percentage_offer: offersProvider.list_offer[index].percentage_offer,
              offer_title: offersProvider.list_offer[index].offer_title,
              image_url: offersProvider.list_offer[index].image_url,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 22,
            );
          },
        );
      },
    );
    return Consumer<Offers_Prov>(
      builder: (context, value, child) {
        return ListView.separated(
          itemCount: value.list_offer.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Widget_Offer(
              percentage_offer: value.list_offer[index].percentage_offer,
              offer_title: value.list_offer[index].offer_title,
              image_url: value.list_offer[index].image_url,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 22,
            );
          },
        );
      },
    );
  }
}
