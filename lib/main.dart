// import 'dart:js';


import 'package:abc/Signup/signup.dart';
import 'package:abc/stratpage.dart';
import 'package:abc/widgets/Homenavbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';

import 'homepage.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    builder: EasyLoading.init(),
//home: CartPage(),
      home: startpage(),
      routes: {
        "login" :(context) => homepage(),
        "signup" :(context) =>  signup(),
        "navBar" :(context) =>  Homenav(),
      },
      //home: EditProfilePage(),
      //home: NotificationPage(),
    //home: FavoriteFoodPage(),
    //home: homepage(),
    //home: OffersPage(),
  )
  );
}




