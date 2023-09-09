import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class itemswidget extends StatelessWidget {
 // const ({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
    shrinkWrap: true,
     childAspectRatio: 0.76,
     children: [
       for(int i=1; i<5; i++)
       Container(
       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
       decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
     color: Colors.red,
   boxShadow: [
     BoxShadow(
  color: Colors.black.withOpacity(0.4),
  spreadRadius: 1,
  blurRadius: 8,
  ),
  ]
  ),
   child: Column(children: [
     InkWell(
       onTap:  () {
         Navigator.pushNamed(context, "singleitempage");
       },
       child: Container(
         margin: EdgeInsets.all(10),
         child: Image.asset("assets/images/burger1.jpg",
         width: 520,
           height: 100,
           fit: BoxFit.cover,
         ),
       ) ,
     ),
     Padding(
       padding: EdgeInsets.only(bottom: 8),
     child: Container(
     alignment: Alignment.centerLeft,
     child: Text("cheese burger",
     style: TextStyle(
       fontSize: 18,
       fontWeight: FontWeight.bold,
       color: Colors.white,
     ),
     ),
     ),
     ),
     Container(
       alignment: Alignment.centerLeft,
       child: Text("Hot Burger",
         style: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.bold,
           color: Colors.white60,
         ),
       ),
     ),
     Padding(padding: EdgeInsets.symmetric(vertical: 10),
     child: Row(
       mainAxisAlignment:MainAxisAlignment.spaceBetween ,
       children: [
         Text("Rs. 70",
         style: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.bold,
           color: Colors.white
         ),
         ),
         Icon(CupertinoIcons.cart_badge_plus, size: 27, color: Colors.white,
         ),
       ],
     ),
     ),
   ],
   ),
       ),
  ],
  );
  }
}
