import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void initState(){
    super.initState();
    fetchCartItems();


  }



  List<String> foodIemIncart=[];
  List food_pathInCart=[];
  List food_priceInCart=[];


  //function to load liked items in the cart

  Future fetchCartItems() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    foodIemIncart=prefs.getStringList("food_name")!;
    food_pathInCart=prefs.getStringList("food_path")!;
    food_priceInCart=prefs.getStringList("food_price")!;
    print("Ekta.." +foodIemIncart.toString());
    setState(() {

    });
  }


  PaymentOption selectedPaymentOption = PaymentOption.CashOnDelivery;

  @override
  Widget build(BuildContext context) {
    return (foodIemIncart.isEmpty)?Scaffold(body: Center(child: Container(
      padding: EdgeInsets.only(top: 100),
        child: Column(
      children: [
        Lottie.asset('assets/Lotties/data_not_found.json'),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, 'navBar');

        }, child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_back,size: 17),
            Text("Back to food shopping",style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 15,)),


          ],
        ),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Colors.brown.shade600,
              fixedSize: Size(300, 50)
          ),)
      ],
    )))):Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: (){
          Navigator.pushNamed(context, 'navBar');
        },child: Icon(Icons.arrow_back)),
        title: Text((foodIemIncart.isEmpty)?"":foodIemIncart[0]),

      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: foodIemIncart.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(4.0),
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 120,width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 60,width:100,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),child: Image.asset((food_pathInCart.isEmpty)?"":food_pathInCart[index],)),
SizedBox(height: 10,),
                      Text((foodIemIncart.isEmpty)?"":foodIemIncart[index]),
                      Text('Price: \Rs. '+food_priceInCart[index]),
                    ],
                  ),

                 Row(
                   children: [
                     ElevatedButton(onPressed: ()async {
                       foodIemIncart.removeAt(index);
                       SharedPreferences prefs= await SharedPreferences.getInstance();
                       prefs.setStringList("food_name", foodIemIncart);
                       //prefs.setStringList("totalAmout", cartItems)
                       print("Removed "+foodIemIncart.toString());
                       setState(() {

                       });

                     }, child: Icon(Icons.remove),style: ElevatedButton.styleFrom(
                         shape: CircleBorder(),
                         fixedSize: Size(10, 10),
                         backgroundColor: Colors.red
                     ),),
                     Text('Quantity: '+foodIemIncart.length.toString()),
                   ],
                 )
                ],
              ),
            )
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),

    );
  }

}

enum PaymentOption { CashOnDelivery, Card, UPI }

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
