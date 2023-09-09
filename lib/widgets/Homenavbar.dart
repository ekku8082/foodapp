import 'package:abc/firstpage.dart';
import 'package:abc/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cartpage.dart';
import '../favourite.dart';
import '../notification.dart';
import '../offers.dart';

class Homenav extends StatefulWidget {
  const Homenav({super.key});

  @override
  State<Homenav> createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  int initialPage=0;

  final pages=[ first(), OffersPage(), NotificationPage(), EditProfilePage(), CartPage() ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black12,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              initialPage=0;
              setState(() {

              });
              Fluttertoast.showToast(msg: "I am Home page");

            }, icon: Icon(Icons.home,size: 35,)),


            IconButton(onPressed: (){
              initialPage=1;
              setState(() {

              });

            },
              icon: Icon(Icons.local_offer_sharp,size: 35),
              color: Colors.white,
            ),
            IconButton(onPressed: (){
              initialPage=2;
              setState(() {

              });

            },
              icon: Icon(Icons.notifications,size: 35),
              color: Colors.white,
            ),
            IconButton(onPressed: (){
              initialPage=3;
              setState(() {

              });

            },
              icon: Icon(Icons.person,size: 35),
              color: Colors.white,
            ),
            IconButton(onPressed: (){
              initialPage=4;
               setState(() {

               });

            },
              icon: Icon(Icons.shopping_cart,size: 35),
              color: Colors.white,
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.redAccent,
            //     borderRadius: BorderRadius.circular(30),
            //    ),
          //   //   child: Icon(
          //   //     CupertinoIcons.cart_fill,
          //   //     color: Colors.white,
          //   //     size: 35,
          //   //   ),
          //   // ),
          //   // Icon(
          //   //   Icons.notifications,
          //   //   color: Colors.white,
          //   //   size: 35,
          //   // ),
          //   // Icon(
          //   //   Icons.person,
          //   //   color: Colors.white,
          //   //   size: 35,
          //   // ),
          ],
        ),


      ),
      body: pages[initialPage],
    );
  }
}
