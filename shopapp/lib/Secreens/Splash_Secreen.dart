import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Secreens/Login_Secreen.dart';
import 'package:shopapp/Secreens/Main_Admin_User.dart';
import 'package:shopapp/Secreens/Main_End_User.dart';

import '../Const_Values.dart';
import '../general.dart';
import 'Bottom_NavigationBar_Secreen/Bottom_NavigationBar_Secreen.dart';
import 'OnBoarding_Secreen.dart';

class splash_secreen extends StatefulWidget {
  const splash_secreen({super.key});

  @override
  State<splash_secreen> createState() => _splash_secreenState();
}

class _splash_secreenState extends State<splash_secreen> {


  checkUserLogin() {
    General.getPrefString(Const_Values.id, "").then(
      (value) {
        if (value == "") {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      value == "" ? const onboarding() : Login_Secreen()),
            ),
          );
        } else {
          General.getPrefString(Const_Values.id_user_type, "").then((value) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => value == "2"
                      ?  ButtomNavigationScreen()
                      : const Main_Admin_Secreen(),
                ),
              ),
            );
          });
        }
      },
    );
  }

  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/Splash.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
