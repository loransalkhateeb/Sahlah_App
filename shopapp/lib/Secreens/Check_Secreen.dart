import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Elevated_Button.dart';
import 'Login_Secreen.dart';
import 'Signup_Admin.dart';
import 'Signup_End_Secreen.dart';

class Cehck_Scereen extends StatefulWidget {
  const Cehck_Scereen({super.key});

  @override
  State<Cehck_Scereen> createState() => _Cehck_ScereenState();
}

class _Cehck_ScereenState extends State<Cehck_Scereen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 442,
              height: 553,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(96),
                      bottomLeft: Radius.circular(96)),
                  gradient: LinearGradient(colors: [
                    Color(0xff23AA49),
                    Color(0xff080101)
                  ])),
              child: const Center(
                child: Text(
                  "Sahlah App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  const Signup_End_User(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                width: 243,
                height: 43,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000), width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFFFFF)),
                child: const Center(
                  child: Text(
                    "Sign Up with end user",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  const Signup_Admin(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                width: 243,
                height: 43,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000), width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFFFFF)),
                child: const Center(
                  child: Text(
                    "Sign Up with Admin",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Elevaed_Button(
              text: 'Login',
              ontap: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  Login_Secreen(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
