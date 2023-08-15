import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skip_Text_Button extends StatefulWidget {
  final VoidCallback? ontap;
  final String text;

  const Skip_Text_Button({super.key, required this.ontap, required this.text});

  @override
  State<Skip_Text_Button> createState() => _Skip_Text_ButtonState();
}

class _Skip_Text_ButtonState extends State<Skip_Text_Button> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:
        widget.ontap,
        child: Text(
          widget.text,
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 19,
              fontWeight: FontWeight.bold),
        ));
  }
}
