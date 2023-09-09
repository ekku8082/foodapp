import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: <Widget>[
          NotificationItem(
            title: 'Order Delivered',
            message: 'Your order #12345 has been delivered.',
            time: '2 minutes ago',
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
          NotificationItem(
            title: 'New Offer',
            message: 'Get 20% off on your next order. Use code: SAVE20',
            time: '1 hour ago',
            icon: Icons.local_offer,
            iconColor: Colors.blue,
          ),
          // Add more NotificationItems as needed
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 40.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(message),
      trailing: Text(
        time,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        // Handle tapping on a notification item here
      },
    );
  }
}
