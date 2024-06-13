import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {
      "text":
          "\"Hungry? Get 20% off your next order at [Restaurant Name]! Limited time only. Order now!\"",
      "time": "8:20am"
    },
    {
      "text":
          "Your order cancelled, the amount \$299/- will be credited to your bank account within 3 working days.",
      "time": "8:20am"
    },
    {
      "text":
          "\"Flash Sale! Get a free dessert with every meal ordered in the next 2 hours!\"",
      "time": "16/05/2024, 10:25pm"
    },
    {
      "text":
          "\"Happy Hour Special! 30% off on all drinks and appetizers from 5 PM to 7 PM. Don’t miss out!\"",
      "time": "17/05/2024, 4:30pm"
    },
    {
      "text":
          "\"Try our new spicy chicken wings at [Restaurant Name]! Get a free drink with your order today only.\"",
      "time": "15/05/2024, 11:25pm"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar( 
        backgroundColor: Colors.black,
        title: const Text('Notifications',
            style: TextStyle(
              fontFamily: 'Sora',
              fontSize: 25,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  notifications[index]["text"]!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  notifications[index]["time"]!,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
