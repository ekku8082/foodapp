import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class desert extends StatefulWidget {
  const desert({super.key});

  @override
  State<desert> createState() => _desertState();
}

class _desertState extends State<desert> {
  List<String> foodItemsImages=["assets/images/deserts/s1.jpg","assets/images/deserts/s2.jpg","assets/images/deserts/s3.jpg","assets/images/deserts/s4.jpg"];
  List<String> foodName=["Strawberries","Cheese Burger","Brownie","Chocolate Milk"];
  List cartIcon=[Icons.shopping_cart,Icons.shopping_cart,Icons.shopping_cart,Icons.shopping_cart];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 30,crossAxisSpacing: 20),
        itemCount: 4,

        itemBuilder: (context,index){
          return   Container(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),



            ),
            child: Column(children: [
              InkWell(
                onTap:  () {
                  Navigator.pushNamed(context, "singleitempage");
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                  child: Image.asset(foodItemsImages[index],
                    width: 520,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ) ,
              ),
              Text(foodName[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text("Hot Burger",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),

              Row(

                mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                children: [
                  Text("Rs. 70",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: index.toString());
                    },
                    child: Icon(cartIcon[index], size: 27, color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
            ),
          );


        });
  }
}
