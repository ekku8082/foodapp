import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: "Burger", price: 75.99, quantity: 2),
    CartItem(name: "Pizza", price: 550.99, quantity: 1),
    // Add more items as needed
  ];

  PaymentOption selectedPaymentOption = PaymentOption.CashOnDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cartItems[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(4.0),
            child: ListTile(
              title: Text(item.name),
              subtitle: Text('Price: \Rs.${item.price.toStringAsFixed(2)}'),
              trailing: Text('Quantity: ${item.quantity}'),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 420.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total: \Rs.${calculateTotal().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height:0),
              Text(
                'Select Payment Method:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height:0),
              Row(
                children: [
                  Radio(
                    value: PaymentOption.CashOnDelivery,
                    groupValue: selectedPaymentOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        selectedPaymentOption = value!;
                      });
                    },
                  ),
                  Text('Cash on Delivery'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: PaymentOption.Card,
                    groupValue: selectedPaymentOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        selectedPaymentOption = value!;
                      });
                    },
                  ),
                  Text('Credit/Debit Card'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: PaymentOption.UPI,
                    groupValue: selectedPaymentOption,
                    onChanged: (PaymentOption? value) {
                      setState(() {
                        selectedPaymentOption = value!;
                      });
                    },
                  ),
                  Text('UPI'),
                ],
              ),
              SizedBox(height:0),
              ElevatedButton(
                onPressed: () {
                  // Implement payment logic here based on selectedPaymentOption
                  // You can navigate to a payment screen or integrate with a payment gateway.
                  Fluttertoast.showToast(
                    msg: 'Payment Successful!',
                    toastLength: Toast.LENGTH_SHORT,
                  );
                },
                child: Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
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
