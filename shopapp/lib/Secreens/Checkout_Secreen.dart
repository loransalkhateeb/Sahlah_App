import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Secreens/cart_secreen.dart';

import '../Providers/Cart_Prov.dart';
import '../Widgets/Elevated_Button.dart';

class CheckOut_Secreen extends StatefulWidget {
  const CheckOut_Secreen({super.key});

  @override
  State<CheckOut_Secreen> createState() => _CheckOut_SecreenState();
}

class _CheckOut_SecreenState extends State<CheckOut_Secreen> {
  TextEditingController _porncode = TextEditingController();
  String ?paywith;
  String ?money;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 129,
              color: const Color(0xff818181).withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffFFFFFF)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CartScreen();
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    const Text(
                      "Checkout",
                      style: TextStyle(
                          color: Color(0xff2A2A2A),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(

                      'images/Group 346.png',
                      width: 49,
                      height: 50,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Delivery Address",
                style: TextStyle(
                    color: Color(0xff2A2A2A),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/place.png',
                    color: const Color(0xff0A9C2D),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assiut - El-Galaa street",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Elgalaa street - First, second section, Assiut\nBehind the events house",
                        style: TextStyle(color: Color(0xff818181), fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  TextButton(
                      onPressed: () {
                        print("Change");
                      },
                      child: const Text(
                        "Change",
                        style: TextStyle(color: Color(0xff23AA49), fontSize: 14),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                const Text(
                  "Promo Code?",
                  style: TextStyle(
                      color: Color(0xff2A2A2A),
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17,right: 80),
                  child: TextFormField(
                    controller: _porncode,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter Your Promo',
                    ),
                  ),
                ),
               const SizedBox(height: 22,),
               SizedBox(
                 width: 200,
                 child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xff23AA49)
                     ),
                     onPressed: (){},
                     child: const Text("Add",
                     style: TextStyle(color: Color(0xffFFFFFF)),
                     )),
               )
              ],
            ),
            const SizedBox(height: 22,),
            const Text("Pay With",
            style: TextStyle(color: Color(0xff2A2A2A),
            fontSize: 17,
              fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(height: 22,),
            Column(
              children: [
                Row(
                  children: [
                    Radio(value: "Debit / Credit Card",
                        groupValue: paywith, onChanged: (value){
                      setState(() {
                        paywith=value;
                      });
                        }),
                    const SizedBox(width: 17,),
                    Image.asset("images/Group 16575.png"),
                    const SizedBox(width: 17,),
                    const Text("Debit / Credit Card"),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: "Cash On Delivery",
                        groupValue: paywith, onChanged: (value){
                          setState(() {
                            paywith=value;
                          });
                        }),
                    const SizedBox(width: 17,),
                    Image.asset("images/money.png"),
                    const SizedBox(width: 17,),
                    const Text("Cash On Delivery"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22,),
            Container(
              width: 370.5,
              height: 132.5,
              decoration: const BoxDecoration(shape: BoxShape.rectangle),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Item total",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Consumer<CartProvider>(
                        builder: (context, value, child) {
                          return Text("${value.totalPrice}");
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Tees",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "5.00 EPG",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Elevaed_Button(text: 'Confirm',
                ontap: (){
                print("Confirme");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
