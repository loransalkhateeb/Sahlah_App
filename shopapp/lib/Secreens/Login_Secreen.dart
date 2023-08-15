import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../Const_Values.dart';
import '../Widgets/Elevated_Button.dart';
import '../Widgets/Loginwith.dart';
import '../general.dart';
import 'Bottom_NavigationBar_Secreen/Bottom_NavigationBar_Secreen.dart';
import 'Check_Secreen.dart';
import 'Checkout_Secreen.dart';
import 'Main_Admin_User.dart';
import 'Main_End_User.dart';

class Login_Secreen extends StatefulWidget {
  Login_Secreen({super.key});

  @override
  State<Login_Secreen> createState() => _Login_SecreenState();
}

class _Login_SecreenState extends State<Login_Secreen> {
  final TextEditingController _emailControllor = TextEditingController();
  final TextEditingController _passwordControllor = TextEditingController();
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
                  gradient: LinearGradient(
                      colors: [Color(0xff23AA49), Color(0xff080101)])),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  width: 320,
                  height: 650,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFFFFFF),
                    boxShadow: const [
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Welcome back",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 16),
                          child: Opacity(
                            opacity: 0.7,
                            child: TextFormField(
                              controller: _emailControllor,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Email must not be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Image.asset(
                                    "images/email 1.png",
                                    width: 19,
                                    height: 19,
                                  ),
                                  hintText: 'Email'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 16),
                          child: TextFormField(
                            controller: _passwordControllor,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                print("B31312");
                              },
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                    color: Color(0xff23AA49),
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Elevaed_Button(
                          text: 'Login',
                          ontap: () {
                            if (fkey.currentState!.validate()) {
                              login();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              const Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                    color: Color(0xff000000), fontSize: 18),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Cehck_Scereen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Color(0xff23AA49), fontSize: 18),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          "or sign in with",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Login_With(
                              image: 'images/google 1.png',
                              ontap: () async {
                                await signInWithGoogle();
                              },
                            ),
                             Login_With(image: 'images/facebook 1.png',
                            ontap: ()async{
                             await signInWithFacebook();
                            },
                            ),
                            const Login_With(image: 'images/gmail 1 (1).png')
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

  login() async {
    EasyLoading.show(status: 'loading...');
    final response = await http
        .post(Uri.parse("${Const_Values.baseurl}login1.php"), body: {
      "email_address": _emailControllor.text,
      "pas": _passwordControllor.text
    });
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonbody = jsonDecode(response.body);
      if (jsonbody['result']) {
        General.savePrefString(Const_Values.id, jsonbody['id']);
        General.savePrefString(Const_Values.user_name, jsonbody['user_name']);
        General.savePrefString(
            Const_Values.email_address, jsonbody['email_address']);
        General.savePrefString(Const_Values.pas, jsonbody['pas']);
        General.savePrefString(
            Const_Values.id_user_type, jsonbody['id_user_type']);
        if (jsonbody['id_user_type'] == "2") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ButtomNavigationScreen();
              },
            ),
          );
        } else if (jsonbody['id_user_type'] == "1") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Main_Admin_Secreen();
              },
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error),
              content: Text(jsonbody['msg']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
