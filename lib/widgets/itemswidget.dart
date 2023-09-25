import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class itemswidget extends StatelessWidget {


  List<String> foodItemsImages=["assets/images/abc.jpg","assets/images/burger1.jpg","assets/images/s1.jpg","assets/images/s2.jpg"];
  List<String> foodName=["Strawberries","Cheese Burger","Brownie","Chocolate Milk"];
 // const ({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 30),
        itemCount: 4,

        itemBuilder: (context,index){
      return   Container(
        height: 500,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
            color: Colors.red,

        ),
        child: Column(children: [
          InkWell(
            onTap:  () {
              Navigator.pushNamed(context, "singleitempage");
            },
            child: Container(
              margin: EdgeInsets.all(10),
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
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [
              Text("Rs. 70",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Icon(CupertinoIcons.cart_badge_plus, size: 27, color: Colors.white,
              ),
            ],
          ),
        ],
        ),
      );


    });
  }
}
