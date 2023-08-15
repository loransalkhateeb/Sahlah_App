import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sun_Category_Widget extends StatefulWidget {
  var id;
  final String imge_url;
  final String name;
  final String price;
  final VoidCallback? ontap;

   Sun_Category_Widget(
      {super.key,
        required this.id,
      required this.imge_url,
      required this.name,
      required this.price,
      this.ontap});

  @override
  State<Sun_Category_Widget> createState() => _Sun_Category_WidgetState();
}

class _Sun_Category_WidgetState extends State<Sun_Category_Widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Color(0xffFBDF6A).withOpacity(0.14)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Image.network(
                  widget.imge_url,
                  width: 110,
                  height: 90,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: Color(0xff2A2A2A),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 73,
                height: 21,
                child: ElevatedButton(
                  onPressed: widget.ontap,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff23AA49)),
                  child: Text(
                    widget.price,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
