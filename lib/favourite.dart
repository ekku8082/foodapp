import 'package:flutter/material.dart';


class FavoriteFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Favorite Food Items'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: favoriteFoodItems.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodItemCard(favoriteFoodItems[index]);
        },
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final String image;

  FoodItem({
    required this.name,
    required this.description,
    required this.image,
  });
}

final List<FoodItem> favoriteFoodItems = [
  FoodItem(
    name: 'Hamburger',
    description: 'patty with lettuce, tomato, and cheese.',
    image: 'assets/images/1.jpg',
  ),
  FoodItem(
    name: 'Pizza',
    description: 'Delicious pizza with a variety of toppings.',
    image: 'assets/images/pizza1.jpg',
  ),
  // Add more favorite food items as needed
];

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;

  FoodItemCard(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            foodItem.image,
            fit: BoxFit.cover,
            height: 90.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodItem.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  foodItem.description,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
