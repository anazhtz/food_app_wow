import 'package:flutter/material.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/home_content/home_screen.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image:
                  AssetImage("assets/images/orderconrm-removebg-preview.png"),
              width: 500,
              height: 350,
            ),
            const Text(
              'Order confirmed',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Sora",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your order id: 8798932245',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Sora",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text(
                "Back Home",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Sora",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: OrangeButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
