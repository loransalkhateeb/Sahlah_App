import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../List_Views/List_Offer_Widget.dart';
import '../Main_End_User.dart';
import 'Bottom_NavigationBar_Secreen.dart';

class Tracj_Secreen extends StatefulWidget {
  const Tracj_Secreen({super.key});

  @override
  State<Tracj_Secreen> createState() => _Tracj_SecreenState();
}

class _Tracj_SecreenState extends State<Tracj_Secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: 129,
          color: Color(0xff707070).withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.only(left: 17, right: 17),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                        color: Color(0xff2A2A2A),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ButtomNavigationScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Special Offers",
                  style: TextStyle(
                      color: Color(0xff2A2A2A),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 90,
                ),
                Image.asset(
                  'images/Group 346.png',
                  width: 49,
                  height: 50,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: List_Offers_View()),
        )
      ],
    ));
  }
}
