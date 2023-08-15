import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Models/Model_Items.dart';
import 'package:shopapp/Providers/category_prov.dart';

import '../Providers/Cart_Prov.dart';
import '../Providers/Items_Prov.dart';
import '../Widgets/Items_Widget.dart';

class List_View_Items extends StatefulWidget {
  var id_category;

  List_View_Items({super.key, required this.id_category});

  @override
  State<List_View_Items> createState() => _List_View_ItemsState();
}

class _List_View_ItemsState extends State<List_View_Items> {
  @override
  void initState() {
    Provider.of<Items_Prove>(context, listen: false)
        .getitems(id_categories: widget.id_category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Items_Prove>(
      builder: (BuildContext context, value, child) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: value.list_items.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: 2,
                        height: 215,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 4),
                itemBuilder: (BuildContext context, int index) {
                  // log('$index');
                  return Items_Widget(
                    image_url: value.list_items[index].image_url,
                    name_cat: value.list_items[index].name_cat,
                    kind: value.list_items[index].kind,
                    price: value.list_items[index].price,
                    ontap: () async {
                      await Provider.of<CartProvider>(context, listen: false)
                          .addToCart(idItem: value.list_items[index].id);
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
