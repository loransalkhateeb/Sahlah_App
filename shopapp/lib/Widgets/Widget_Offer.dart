import 'package:flutter/cupertino.dart';

class Widget_Offer extends StatelessWidget {
  final String percentage_offer;
  final String offer_title;
  final String image_url;

  const Widget_Offer(
      {super.key,
      required this.percentage_offer,
      required this.offer_title,
      required this.image_url,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: Color(0xff23AA49)
          ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18,top: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  percentage_offer,
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  offer_title,
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 25,
                      ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 17,
          ),
          Positioned(
              left: 200,
              top: 20,
              child: Image.network(image_url,
              width: 140,
                height: 140,
              ))
        ],
      ),
    );
  }
}
