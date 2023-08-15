import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_With extends StatefulWidget {
  final VoidCallback? ontap;
  final String image;

  const Login_With({super.key, this.ontap, required this.image});

  @override
  State<Login_With> createState() => _Login_WithState();
}

class _Login_WithState extends State<Login_With> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: widget.ontap,
        child: Image.asset(widget.image,
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
