// import 'dart:js';

import 'package:abc/bottomnavigator/bottomnav.dart';
import 'package:abc/profilepage.dart';
import 'package:abc/singleitempage.dart';
import 'package:abc/widgets/Homenavbar.dart';
import 'package:flutter/material.dart';

import 'cartpage.dart';
import 'favourite.dart';
import 'firstpage.dart';
import 'homepage.dart';
import 'notification.dart';
import 'offers.dart';

void main() {
  runApp(MaterialApp(
//home: CartPage(),
      home: homepage(),
      //home: EditProfilePage(),
      //home: NotificationPage(),
    //home: FavoriteFoodPage(),
    //home: homepage(),
    //home: OffersPage(),
  )
  );
}




