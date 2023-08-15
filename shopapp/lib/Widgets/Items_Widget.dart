import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Widgets/searchbar_of_all_secreens.dart';

import 'App_Barof_All_secreens.dart';

class Items_Widget extends StatefulWidget {
   var image_url;
   var name_cat;
   var kind;
   var price;
  var main_title;
  var ontap;

   Items_Widget(
      {super.key,
      required this.image_url,
      required this.name_cat,
      required this.kind,
      required this.price, this.main_title, this.ontap});

  @override
  State<Items_Widget> createState() => _Items_WidgetState();
}

class _Items_WidgetState extends State<Items_Widget> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:  Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xff5BE07A).withOpacity(0.33),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.network(widget.image_url),
                  ),
                  Text(
                    widget.name_cat,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.kind,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff818181),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                             Text("${widget.price}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff23AA49),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: widget.ontap,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Color(0xff23AA49), shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            // IconButton(onPressed: (){}, icon: ),padding: EdgeInsets.zero,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  }
}
