import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Elevaed_Button extends StatefulWidget {
  final String text;
  final VoidCallback? ontap;

  const Elevaed_Button({super.key, required this.text, this.ontap});

  @override
  State<Elevaed_Button> createState() => _Elevaed_ButtonState();
}

class _Elevaed_ButtonState extends State<Elevaed_Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: 243,
        height: 43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xff23AA49), Color(0xff000000)])),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
