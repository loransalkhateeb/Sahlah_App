import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Special_Offer extends StatefulWidget {
  final String text1;
  final String text2;
  const Special_Offer({super.key, required this.text1, required this.text2});

  @override
  State<Special_Offer> createState() => _Special_OfferState();
}

class _Special_OfferState extends State<Special_Offer> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text1,
            style: TextStyle(color: Color(0xff000000),
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          Text(widget.text2,
            style: TextStyle(color: Color(0xff0A9C2D),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
            ),
          )
        ],
      ),
    );
  }
}
