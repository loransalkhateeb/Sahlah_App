// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopapp/Widgets/Cart_Widget.dart';
//
// import '../Providers/Cart_Prov.dart';
//
// class List_View_Cart extends StatefulWidget {
//   const List_View_Cart({super.key});
//
//   @override
//   State<List_View_Cart> createState() => _List_View_CartState();
// }
//
// class _List_View_CartState extends State<List_View_Cart> {
//   @override
//   void initState() {
//     Provider.of<CartProv>(context, listen: false).getCart();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartProv>(
//       builder: (context, value, child) {
//         return ListView.separated(
//           itemCount: value.listCartModel.length,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             return Cart_Widget(
//               image_url: value.listCartModel[index].image_url,
//               text1: value.listCartModel[index].name_cat,
//               text2: value.listCartModel[index].id_items,
//               price: value.listCartModel[index].price.toString(),
//               count: value.listCartModel[index].count,
//                ontap1: () {
//                  Provider.of<CartProvider>(context, listen: false).updateCart(id: ,
//                      Count: Count);
//                },
//               ontap2: () async{
//                 if (value.listCartModel[index].count != 1) {
//                   value.listCartModel[index].count =
//                       value.listCartModel[index].count - 1;
//                   value.updateCart(
//                     index: value.listCartModel[index].id,
//                     count: (value.listCartModel[index].count)
//                         .toString(),
//                   );
//                 } else {
//                   await value.deleteFromCart(index: index);
//                 }
//               },
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return SizedBox(
//               height: 22,
//             );
//           },
//         );
//       },
//     );
//   }
// }
