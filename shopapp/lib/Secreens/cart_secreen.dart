import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Secreens/Checkout_Secreen.dart';
import 'package:shopapp/Secreens/Empty_Secreen.dart';

import '../Providers/Cart_Prov.dart';
import '../Widgets/App_Barof_All_secreens.dart';
import '../Widgets/Elevated_Button.dart';
import 'Bottom_NavigationBar_Secreen/Bottom_NavigationBar_Secreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AppBar_of_All_Secreens(
            title: 'Deliver to',
            name: 'El-Galaa.st Thani,Assiut',
            imageasset: 'images/Group 346.png',
            imageasset2: 'images/place.png',
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ButtomNavigationScreen();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                const Text(
                  "This is the Cart secreen",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.listCart.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.network(
                              value.listCart[index].image_url,
                              width: 150,
                              height:
                                  (MediaQuery.of(context).size.height * .2) -
                                      16,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              children: [
                                Text(
                                  value.listCart[index].name_cat,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        value.listCart[index].count =
                                            value.listCart[index].count + 1;
                                        value.updateCart(
                                          id: value.listCart[index].id,
                                          Count: (value.listCart[index].count)
                                              .toString(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    Text(
                                      value.listCart[index].count
                                          .toString(),
                                    ),
                                    IconButton(
                                      onPressed: () async{
                                        if (value.listCart[index].count != 1) {
                                          value.listCart[index].count =
                                              value.listCart[index].count - 1;
                                          value.updateCart(
                                            id: value.listCart[index].id,
                                            Count: (value.listCart[index].count)
                                                .toString(),
                                          );
                                        } else {
                                          await value.deleteFromCart(index: index);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
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
            padding: const EdgeInsets.only(bottom: 20),
            child: Elevaed_Button(
              text: 'Checkout',
              ontap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CheckOut_Secreen();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
