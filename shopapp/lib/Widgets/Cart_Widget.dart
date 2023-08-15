import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Cart_Prov.dart';
import 'package:shopapp/Widgets/Elevated_Button.dart';
import 'package:shopapp/Widgets/searchbar_of_all_secreens.dart';

import 'App_Barof_All_secreens.dart';

class Cart_Widget extends StatefulWidget {
  final String image_url;
  final String text1;
  final String text2;
  final String price;
  final VoidCallback? ontap1;
  final VoidCallback? ontap2;
  final int count;

  const Cart_Widget(
      {super.key,
      required this.image_url,
      required this.text1,
      required this.text2,
      required this.price,
      this.ontap1,
      this.ontap2,
      required this.count});

  @override
  State<Cart_Widget> createState() => _Cart_WidgetState();
}

class _Cart_WidgetState extends State<Cart_Widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar_of_All_Secreens(
          title: 'Deliver to',
          name: 'El-Galaa.st Thani,Assiut',
          imageasset: 'images/Group 346.png',
          imageasset2: 'images/place.png',
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
           width: 400,
           height: 108,
           margin: EdgeInsets.all(17),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(30),
             color: Colors.grey
           ),
           child: Row(
            children: [
              SizedBox(width: 12,),
               Image.network(
                 widget.image_url,
                 width: 90.58,
                 height: 74.28,
               ),
               SizedBox(
                 width: 17,
               ),
               Column(
                 children: [
                   SizedBox(height: 20,),
                   Text(
                     widget.text1,
                     style: TextStyle(
                         color: Color(0xff09051C),
                         fontSize: 17,
                         fontWeight: FontWeight.bold),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     widget.text2,
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 15,
                         fontWeight: FontWeight.bold),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     widget.price,
                     style: TextStyle(
                         color: Color(0xff23AA49),
                         fontSize: 17,
                         fontWeight: FontWeight.w500),
                   )
                 ],
               ),
               SizedBox(
                 width: 55,
               ),
               Row(
                 children: [
                   Padding(
                     padding: EdgeInsets.only(bottom: 8),
                     child: IconButton(
                       icon: Icon(Icons.minimize),
                       onPressed: widget.ontap2
                     ),
                   ),
               SizedBox(
                     width: 10,
                 ),
                   Text(
                     "${widget.count}",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 14,
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 7),
                     child: IconButton(
                       icon: Icon(Icons.add),
                       onPressed: widget.ontap1
                     ),
                   ),
                 ],
               )
             ],
           ),
         ),
         SizedBox(
           height: 40,
         ),
         Container(
           width: 370.5,
           height: 132.5,
           decoration: BoxDecoration(shape: BoxShape.rectangle),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Item total",
                     style: TextStyle(color: Colors.black, fontSize: 18),
                   ),
                   Consumer<CartProvider>(
                     builder: (context, value, child) {
                       return Text(value.totalPrice.toString());
                     },
                   )
                 ],
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Delivery Tees",
                     style: TextStyle(color: Colors.black, fontSize: 18),
                   ),
                   Text(
                     "5.00 EPG",
                     style: TextStyle(color: Colors.black, fontSize: 15),
                   )
                 ],
              ),
             ],
           ),
         ),
        Elevaed_Button(
          text: 'Checkout',
          ontap: () {
            print("Checkpout");
          },
        )
      ],
    );
  }
}
