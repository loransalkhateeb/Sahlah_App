import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../Providers/Cart_Prov.dart';
import '../Providers/Category_Item_Provider.dart';
import '../Widgets/item_category.dart';

class List_view_Cate_Item extends StatefulWidget {

  var id_sub_items;

   List_view_Cate_Item({super.key,required this.id_sub_items});

  @override
  State<List_view_Cate_Item> createState() => _List_view_Cate_ItemState();
}

class _List_view_Cate_ItemState extends State<List_view_Cate_Item> {

  @override
  void initState() {
    Provider.of<Category_item_provider>(context, listen: false)
        .getdata(id_items: widget.id_sub_items);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<Category_item_provider>(
      builder: (BuildContext context, value, child) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: value.list_item_category.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    height: 215,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4),
                itemBuilder: (BuildContext context, int index) {
                  // log('$index');
                  return Item_cat_Widget(
                    image_url: value.list_item_category[index].image_url,
                    id: value.list_item_category[index].id,
                    description: value.list_item_category[index].description,
                    price: value.list_item_category[index].price,
                    title_item: value.list_item_category[index].title_item,
                    ontap: ()async{
                      await Provider.of<CartProvider>(context, listen: false)
                          .addToCart2(id_sub_item: value.list_item_category[index].id);
                  },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

}


// custom Sliver Grid Delegate
class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight
    extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
  })  : assert(
  crossAxisCount > 0,
  ),
        assert(mainAxisSpacing >= 0),
        assert(crossAxisSpacing >= 0),
        assert(height > 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// The height of the crossAxis.
  final double height;

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(
      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}
