import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Secreens/Bottom_NavigationBar_Secreen/Profile_Secreen.dart';
import 'package:shopapp/Widgets/Elevated_Button.dart';

class Payments_Secreen extends StatefulWidget {
  const Payments_Secreen({super.key});

  @override
  State<Payments_Secreen> createState() => _Payments_SecreenState();
}

class _Payments_SecreenState extends State<Payments_Secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 129,
            color: Color(0xff818181).withOpacity(0.3),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffFFFFFF)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Profile_Secreen();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Text(
                    "Checkout",
                    style: TextStyle(
                        color: Color(0xff2A2A2A),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
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
          SizedBox(
            height: 60,
          ),
          Padding(
            padding:  EdgeInsets.only(right:200),
            child: Text("Card Type",
                style: TextStyle(color: Color(0xff1E1E1E), fontSize: 22)),
          ),
          SizedBox(height: 60,),
         InkWell(
           child: Image.asset("images/paypal-2 (1) 1.png"),
           onTap: (){
             print("kejfkej");
           },
         ),
          SizedBox(height: 35,),
          InkWell(
            child: Image.asset("images/Group.png"),
            onTap: (){
              print("kejfkej");
            },
          ),
          SizedBox(height: 35,),
          InkWell(
            child: Image.asset("images/image 1.png"),
            onTap: (){
              print("kejfkej");
            },
          ),
          SizedBox(height: 200,),
          Elevaed_Button(text: 'Add Cart',
           ontap: (){},
          )
        ],
      ),
    );
  }
}
