import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OffersPage(),
    );
  }
}

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Offers'),
      ),
      body: ListView.builder(
        itemCount: specialOffers.length,
        itemBuilder: (BuildContext context, int index) {
          return OfferCard(specialOffers[index]);
        },
      ),
    );
  }
}

class Offer {
  final String title;
  final String description;
  final String image;

  Offer({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<Offer> specialOffers = [
  Offer(
    title: '50% Off on Pizzas',
    description: 'Order any pizza and get 50% off your second pizza.',
    image: 'assets/images/pizza1.jpg',
  ),
  Offer(
    title: 'Free Delivery',
    description: 'Enjoy free delivery on orders above \$25.',
    image: 'assets/images/pizza1.jpg',
  ),
  // Add more offers as needed
];

class OfferCard extends StatelessWidget {
  final Offer offer;

  OfferCard(this.offer);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            offer.image,
            fit: BoxFit.cover,
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  offer.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  offer.description,
                  style: TextStyle(
                    color: Colors.grey,
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
