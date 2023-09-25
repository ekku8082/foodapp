import 'package:abc/firstpage.dart';
import 'package:abc/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cartpage.dart';
import '../favourite.dart';
import '../notification.dart';
import '../offers.dart';

class Homenav extends StatefulWidget {
   Homenav({super.key});

  @override
  State<Homenav> createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {



  @override
  void initState(){
    super.initState();


  }

  int initialPage=0;


  List<String> dropdownMenuItems=["Paytm","Google Pay","UPI","Credit Card"];

  final pages=[ first(), OffersPage(), NotificationPage(), EditProfilePage(), CartPage() ];
  List<String> getFoodprice=[];
  String totalPriceToGive="";
  int initialPrice=0;
  int finalPrice=0;
  String dropdownInitialItme="Paytm";


  Future getPayOutCashValue() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
   getFoodprice= prefs.getStringList('food_price')!;
   print(getFoodprice.toString());

   for(int i=0;i<getFoodprice.length;i++)
     {
       initialPrice=int.parse(getFoodprice[i]);
       finalPrice=initialPrice+finalPrice;
       setState(() {

       });
     }


   print(initialPrice);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: (initialPage==4)?paymentLaout():Container(
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


// payment layout page bottom sheet


  Widget paymentLaout()
  {
    return Container(
      color:Colors.brown.shade400,
      height:80 ,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children : [



    Text("Grand Total : -"+finalPrice.toString()),
          ElevatedButton(onPressed: (){

                

          }, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Checkout",style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 15,)),

              Icon(Icons.arrow_forward_outlined,size: 17),
            ],
          ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.brown.shade600,
                fixedSize: Size(120, 50)
            ),)
        ],
      ),
    );
  }
}
