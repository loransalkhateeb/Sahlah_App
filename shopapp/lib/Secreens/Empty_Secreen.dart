import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/App_Barof_All_secreens.dart';
import 'Bottom_NavigationBar_Secreen/Bottom_NavigationBar_Secreen.dart';

class Empty_Secreen extends StatefulWidget {
  const Empty_Secreen({super.key});

  @override
  State<Empty_Secreen> createState() => _Empty_SecreenState();
}

class _Empty_SecreenState extends State<Empty_Secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBar_of_All_Secreens(
            title: 'Deliver to',
            name: 'El-Galaa.st Thani,Assiut',
            imageasset: 'images/Group 346.png',
            imageasset2: 'images/place.png',
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey
            ),
            child: IconButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ButtomNavigationScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_ios_new,size: 20,),
            ),
          ),
          Image.asset("images/Group 16631.png")
        ],
      ),
    );
  }
}
