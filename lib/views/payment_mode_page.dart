import 'package:flutter/material.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/order_confirmed.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: WhiteColor,
            fontSize: 20,
            fontFamily: "Sora",
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentOption(
                0,
                'Credit Card',
                'assets/images/MasterCard_Logo.svg.png',
                '**** 1606',
                '+91 6006 **** 24'),
            _buildPaymentOption(1, 'Paypal', 'assets/images/Visa_2021.svg.png',
                '**** 5221', '5221 **** 2465'),
            _buildPaymentOption(2, 'Google Pay', 'assets/images/G_Pay_Logo.svg',
                '**** 4142', '+91 12**** 7667'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8)),
                    child: const TextField(
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Promo Code",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Sora",
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.book_online,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: OrangeButtonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(fontFamily: "Sora", color: WhiteColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildAmountDetails(
              'Transfer Amount',
              '\$30.20',
            ),
            const SizedBox(
              height: 20,
            ),
            _buildAmountDetails('Additional Cost', '\$0.50'),
            const Divider(thickness: 1, color: Colors.white54),
            const SizedBox(
              height: 20,
            ),
            _buildAmountDetails('Total', '\$30.70'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderConfirmed()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: OrangeButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 0),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                    fontFamily: "Sora",
                    color: WhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int index, String title, String assetPath,
      String cardDigits, String cardNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _selectedPaymentMethod == index
                ? [Colors.blue.shade900, Colors.blue]
                : [Colors.grey.shade800, Colors.grey.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selectedPaymentMethod == index
                ? Colors.blue
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              assetPath,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "Sora"),
                ),
                Text(cardNumber, style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const Spacer(),
            if (_selectedPaymentMethod == index)
              const Icon(Icons.radio_button_checked, color: Colors.red)
            else
              const Icon(Icons.radio_button_off, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountDetails(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.bold)),
          Text(amount,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: WhiteColor)),
        ],
      ),
    );
  }
}
