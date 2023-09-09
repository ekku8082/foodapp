import 'package:abc/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class singleitempage extends StatelessWidget {
  const singleitempage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25, left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context, CartPage());

                    },
                    child: Icon(Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                     // Navigator.pop(context, CartPage());
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder:(BuildContext context) =>
                              new CartPage()
                          )
                      );
                    },
                    child: Icon(
                    CupertinoIcons.cart_fill,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:10 ),
                child: Image.asset("assets/images/burger1.jpg",
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Hot & fresh burger", style: TextStyle(color: Colors.white),),
                  ],
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
