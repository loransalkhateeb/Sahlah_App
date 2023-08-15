import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cat_Widgets extends StatefulWidget {
  final String icon;
  final VoidCallback? ontap;
  final String name;

  Cat_Widgets(
      {super.key, required this.icon, required this.ontap, required this.name});

  @override
  State<Cat_Widgets> createState() => _Cat_WidgetsState();
}

class _Cat_WidgetsState extends State<Cat_Widgets> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Column(
        children: [
          Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xff707070).withOpacity(0.2)),
              child: Image.network(
                widget.icon,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.name,
            style: TextStyle(
                color: Color(0xff2A2A2A),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
