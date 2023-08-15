import 'package:flutter/cupertino.dart';

class Banner_Offer_Widget extends StatefulWidget {
  final String percentage_offer;
  final String offer_title;
  final String image_url;
  final String image;

  const Banner_Offer_Widget(
      {super.key,
      required this.percentage_offer,
      required this.offer_title,
      required this.image_url,
      required this.image});

  @override
  State<Banner_Offer_Widget> createState() => _Banner_Offer_WidgetState();
}

class _Banner_Offer_WidgetState extends State<Banner_Offer_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
        width: 390,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color(0xff23AA49),
            Color(0xff5BE07A)
          ]
        )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.percentage_offer,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.offer_title,
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Image.asset(widget.image,
                  width: 208,
                    height: 191,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
