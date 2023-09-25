import 'package:abc/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100,bottom: 80),
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Lottie.asset('assets/Lotties/logo_lottie.json'),
            Text("Ekta's Food Corner",style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 30,color: Colors.grey)),
            Spacer(),
            ElevatedButton(onPressed: (){
             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage()));
              Navigator.pushNamed(context, 'login');



            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Continue to the app",style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 15,)),

                Icon(Icons.arrow_forward_outlined,size: 17),
              ],
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Colors.brown.shade600,
              fixedSize: Size(200, 50)
            ),)

          ]
        ),
      ),
    );
  }
}
