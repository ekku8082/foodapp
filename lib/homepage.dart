import 'package:abc/widgets/Homenavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 50,left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/abc.jpg",height: 320,width: 450,fit: BoxFit.cover,),//imgasset
              Container(height: 500,
                child: Column(children: [
                  Text("Login now",style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 20,
                    ),
                    child: const  Text("please enter details below to continue"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'username',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text("Forgot password?",
                        style: TextStyle(color: Colors.deepOrange),),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(100),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homenav()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: const Text("LOGIN", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                        ),
                      ),
                    ],

                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don't have an account?"),
                      TextButton(onPressed: (){}, child: Text("Register", style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                      ),
                    ],
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
