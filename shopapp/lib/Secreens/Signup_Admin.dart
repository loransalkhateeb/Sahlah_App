import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;

import '../Const_Values.dart';
import '../Widgets/Elevated_Button.dart';
import '../Widgets/Loginwith.dart';
import 'login_secreen.dart';

class Signup_Admin extends StatefulWidget {
  const Signup_Admin({super.key});

  @override
  State<Signup_Admin> createState() => _Signup_AdminState();
}

class _Signup_AdminState extends State<Signup_Admin> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassowrd = TextEditingController();
  var fkey = GlobalKey<FormState>();
  bool isPassShown = true;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Stack(
          children: [
            Container(
              width: 442,
              height: 350,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90)),
                  gradient: LinearGradient(colors: [
                    Color(0xff23AA49),
                    Color(0xff080101)
                  ])),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  width: 320,
                  height: 650,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff23AA49),
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Registration",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 17, right: 16),
                          child: Opacity(
                            opacity: 0.7,
                            child: TextFormField(
                              controller: _username,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "User_Name must not be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Image.asset(
                                    "images/user1 1.png",
                                    width: 19,
                                    height: 19,
                                  ),
                                  hintText: 'User_Name'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 17, right: 16),
                          child: TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Email Address must not be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Image.asset("images/email 1.png"),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 17, right: 16),
                          child: TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Image.asset("images/key 1.png"),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 17, right: 16),
                          child: TextFormField(
                            controller: _confirmpassowrd,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Confirme Password must not be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Image.asset("images/key 1.png"),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Elevaed_Button(
                          text: 'Signup',
                          ontap: () {
                            if (fkey.currentState!.validate()) {
                              if (_password.text == _confirmpassowrd.text) {
                                signup();
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                    color: Color(0xff000000), fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "or sign up with",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Login_With(
                              image: 'images/google 1.png',
                              ontap: () {
                                print("GOOGLE");
                              },
                            ),
                            Login_With(image: 'images/facebook 1.png'),
                            Login_With(image: 'images/gmail 1 (1).png')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  signup() async {
    EasyLoading.show(status: 'loading...');
    final respose = await http
        .post(Uri.parse("${Const_Values.baseurl}signup_admins.php"), body: {
      "user_name": _username.text,
      "email_address": _email.text,
      "pas": _password.text,
      "confirm_pass": _confirmpassowrd.text
    });
    EasyLoading.dismiss();
    if (respose.statusCode == 200) {
      var jsonbody = jsonDecode(respose.body);
      if (jsonbody['result']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Login_Secreen();
            },
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error),
              content: const Text("signUp failed email exist"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
