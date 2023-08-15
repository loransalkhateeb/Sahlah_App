import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main_Admin_Secreen extends StatefulWidget {
  const Main_Admin_Secreen({super.key});

  @override
  State<Main_Admin_Secreen> createState() => _Main_Admin_SecreenState();
}

class _Main_Admin_SecreenState extends State<Main_Admin_Secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Admin Secreen",
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    );
  }
}
