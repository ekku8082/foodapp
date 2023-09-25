import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  void  initState()
  {
    super.initState();

    checkCartItems();

  }

  List<String> addFood_ItemsWhenComigback=[];
  List<String> addFood_pathItemsWhenComigback=[];
  List<String> addFood_ItemsPriceWhenComigback=[];




  List<String> foodItemsImages=["assets/images/burger/bug2.jpg","assets/images/burger/bug3.jpg","assets/images/burger/bug4.jpg","assets/images/burger/bug2.jpg"];
List<String> foodName=["Wrap and burger","Cheese burger","Brownie","Chocolate Milk"];
List cartIcon=[Icons.shopping_cart,Icons.shopping_cart,Icons.shopping_cart,Icons.shopping_cart];
List price = ["120","100","180","150"];
  List<String> itemincart=[];
  List<String> imagePathincart=[];
  List<String> itemsPriceincart=[];
  void checkCartItems() async
  {
    SharedPreferences pref=await SharedPreferences.getInstance();
    // pref.getStringList("burger");
    if(pref.getStringList("food_name")!.isNotEmpty)
    {

      addFood_ItemsWhenComigback=pref.getStringList("food_name")!;
      addFood_pathItemsWhenComigback=pref.getStringList("food_path")!;
      addFood_ItemsPriceWhenComigback=pref.getStringList("food_price")!;
      setState(() {

      });
       for(int i=0;i<=addFood_ItemsWhenComigback.length-1;i++)
          {
            int index=foodName.indexOf(addFood_ItemsWhenComigback[i]);
            itemincart.add(addFood_ItemsWhenComigback[index]);
            imagePathincart.add(addFood_pathItemsWhenComigback[index]);
            itemsPriceincart.add(addFood_ItemsPriceWhenComigback[index]);
          }
      Fluttertoast.showToast(msg:"Ekta "+itemincart.toString()+" "+imagePathincart.toString());

    }
  }

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
                  GestureDetector(
                    onTap: () async{
                      SharedPreferences prefs=await SharedPreferences.getInstance();
                      prefs.clear();
                      itemincart.clear();
                      imagePathincart.clear();
                      itemsPriceincart.clear();
                      Fluttertoast.showToast(msg: "Prefs cleared");
                    },
                    child: Text("Rs."+price[index],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {

                      SharedPreferences prefs=await SharedPreferences.getInstance();
                       // prefs.clear();
                      /*itemincart.clear();
                      imagePathincart.clear();
                      itemsPriceincart.clear();*/

                      if(!itemincart.contains(foodName[index]) || !imagePathincart.contains(foodItemsImages[index]) || !itemsPriceincart.contains(price[index]))
                        {
                          itemincart.add(foodName[index]);
                          prefs.setStringList("food_name", itemincart);
                          imagePathincart.add(foodItemsImages[index]);
                          prefs.setStringList("food_path", imagePathincart);
                          itemsPriceincart.add(price[index]);
                          prefs.setStringList("food_price", itemsPriceincart);
                        }


                      setState(() {

                      });
                      print("Items"+itemincart.toString());
                      print("Items"+imagePathincart.toString());
                      print("Items"+itemsPriceincart.toString());
                      Fluttertoast.showToast(msg: itemincart.toString()+" "+imagePathincart.toString());






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
