import 'package:flutter/material.dart';

class PaymentModeOptions extends StatefulWidget {
  const PaymentModeOptions({super.key});

  @override
  State<PaymentModeOptions> createState() => _PaymentModeOptionsState();
}

class _PaymentModeOptionsState extends State<PaymentModeOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Image(image: AssetImage("assets/images/Google-Pay-logo.png")),
            )
          ],
        ),
      ),
    );
  }
}