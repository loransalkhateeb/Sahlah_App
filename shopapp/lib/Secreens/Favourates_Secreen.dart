import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourates_Secreen extends StatefulWidget {
  const Favourates_Secreen({super.key});

  @override
  State<Favourates_Secreen> createState() => _Favourates_SecreenState();
}

class _Favourates_SecreenState extends State<Favourates_Secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Favourates Secreen",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}
