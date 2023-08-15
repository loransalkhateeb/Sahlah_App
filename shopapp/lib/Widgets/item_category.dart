import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item_cat_Widget extends StatelessWidget {
  var id;
  var image_url;
  var title_item;
  var description;
  var price;
  var ontap;

  Item_cat_Widget(
      {super.key,
      required this.id,
      required this.title_item,
      required this.description,
      required this.image_url,
      required this.price,
      required this.ontap
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 110,
                  child: Image.network(image_url),
                ),
                Text(
                    title_item,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff818181),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("${price}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff23AA49),
                          ),
                        ),
                        SizedBox(width: 14,),
                        Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: InkWell(
                            onTap: ontap,
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
