import 'package:abc/pasta.dart';
import 'package:abc/pizza.dart';
import 'package:abc/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'desert.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(padding: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    InkWell(
                      onTap: (){},
                      child: Icon(Icons.abc_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Icon(Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Hot & Fast Food", style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Delivery on time", style: TextStyle(
                    color: Colors.white54,
                    fontSize: 32,
                  ),
                  ),
                ),
                SizedBox(height: 30),
                TabBar(
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding: EdgeInsets.symmetric(horizontal:20),
                  tabs: [
                    Tab(text: "Burger"),
                    Tab(text: "Pizza"),
                    Tab(text: "Pasta"),
                    Tab(text: "desert"),
                  ],
                ),
                Flexible(
                    flex: 1,
                    child: TabBarView(

                      children: [
                        test(),
                        pizza(),
                        pasta(),
                        desert(),
                        // Container(color: Colors.red),
                        // Container(color: Colors.red),
                        //       Container(color: Colors.red),

                      ],)),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
