import 'package:abc/widgets/Homenavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'firstpage.dart';

class homepage extends StatelessWidget {
   homepage({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         // color: Colors.grey,
          padding: EdgeInsets.only(top: 100,left: 30,right: 30),
          child: Column(
            children: [
             // Image.asset("assets/images/logo/home_logo.jpeg",height: 320,width: 450,fit: BoxFit.cover,),//imgasset
              Container(
               // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Login",style: GoogleFonts.lato(color:Colors.black,fontSize: 50,fontWeight: FontWeight.w400)
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 20,
                    ),
                    child:   Text("Please enter details below to continue",style: GoogleFonts.lato(color:Colors.grey,fontSize: 15,fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black87)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black87)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),

                ],),
              ),
              Container(//color: Colors.red,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text("Forgot password?",
                        style: TextStyle(color: Colors.black87),),
                    ),
                  ),
                  SizedBox(height: 50,),


                  // Login Button

                 ElevatedButton(
                     onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homenav()));},
                     child: Text("Log In",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w600),),
                 style: ElevatedButton.styleFrom(
                   fixedSize: Size(200, 50),
                   shape: StadiumBorder(),
                   backgroundColor: Colors.brown.shade600
                 ),),
                  SizedBox(height: 40,),
                  GestureDetector(onTap: () async {

                    signup(context);
                  },child: SvgPicture.asset('assets/images/logo/google.svg')),

                SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, 'signup');
                      }, child: Text("Register", style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                      ),
                    ],
                  )
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }

   Future<void> signup(BuildContext context) async {
     await EasyLoading.show(status: "Signing up");
     final GoogleSignIn googleSignIn = GoogleSignIn();
     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
     if (googleSignInAccount != null) {
       final GoogleSignInAuthentication googleSignInAuthentication =
       await googleSignInAccount.authentication;
       final AuthCredential authCredential = GoogleAuthProvider.credential(
           idToken: googleSignInAuthentication.idToken,
           accessToken: googleSignInAuthentication.accessToken);

       // Getting users credential
       UserCredential result = await auth.signInWithCredential(authCredential);
       User? user = result.user;

       if (result != null) {
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => Homenav()));
         EasyLoading.dismiss();
       }  // if result not null we simply call the MaterialpageRoute,
       // for go to the HomePage screen
     }
   }
}
