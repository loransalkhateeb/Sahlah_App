import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar_of_All_Secreens extends StatefulWidget {
  final String title;
  final String name;
  final String imageasset;
  final String imageasset2;
  final VoidCallback? icon;

  const AppBar_of_All_Secreens({super.key, required this.title, required this.name, required this.imageasset, this.icon, required this.imageasset2});

  @override
  State<AppBar_of_All_Secreens> createState() => _AppBar_of_All_SecreensState();
}

class _AppBar_of_All_SecreensState extends State<AppBar_of_All_Secreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 129,
      color: Color(0xff707070).withOpacity(0.2),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(widget.title,
                  style: TextStyle(color: Colors.black,
                  fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'
                  ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Image.asset(widget.imageasset2,
                    width: 17.42,
                      height: 21.77,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 15,),
                    Text(widget.name,
                    style: TextStyle(color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    )
                  ],
                ),

              ],
            ),
            Image.asset(widget.imageasset,
              width: 49,
              height: 50,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
