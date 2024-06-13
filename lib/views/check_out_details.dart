import 'package:flutter/material.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/order_confirmed.dart';
import 'package:food_app_wow/views/payment_mode_page.dart';

class CheckOutDetails extends StatefulWidget {
  const CheckOutDetails({super.key});

  @override
  State<CheckOutDetails> createState() => _CheckOutDetailsState();
}

class _CheckOutDetailsState extends State<CheckOutDetails> {
  String address = "Areekode, Kerala, India \n+91 81368000569";
  double deliveryFee = 40;
  double totalPrice = 399;
  double grandTotal = 439;
  bool isUPISelected = false;

  void _editAddress() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController addressController =
            TextEditingController(text: address);
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 8,
          title: const Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Edit Address',
                style: TextStyle(
                  fontFamily: "Sora",
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: TextField(
            controller: addressController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Enter new address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "New Address",
              labelStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  address = addressController.text;
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _applyCoupon() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Available Offers',
            style: TextStyle(
              fontFamily: "Sora",
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.green),
                title: const Text(
                  '10% off',
                  style: TextStyle(
                    fontFamily: "Sora",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    totalPrice *= 0.9;
                    grandTotal =
                        isUPISelected ? totalPrice : totalPrice + deliveryFee;
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(color: Colors.grey), // Add a subtle divider
              ListTile(
                leading: const Icon(Icons.money_off, color: Colors.blue),
                title: const Text(
                  'Flat 50 off',
                  style: TextStyle(
                    fontFamily: "Sora",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    totalPrice -= 50;
                    grandTotal =
                        isUPISelected ? totalPrice : totalPrice + deliveryFee;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updatePaymentMode(bool isUPI) {
    setState(() {
      isUPISelected = isUPI;
      if (isUPISelected) {
        grandTotal = totalPrice;
      } else {
        grandTotal = totalPrice + deliveryFee;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Checkout Details",
          style: TextStyle(
            fontFamily: "Sora",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Delivery Address",
                    style: TextStyle(
                        fontFamily: "Sora", fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: height * 0.01),
                  const Divider(
                    color: Color.fromARGB(255, 144, 142, 142),
                    thickness: .7,
                  ),
                  const Text(
                    "Anaz Htz",
                    style: TextStyle(
                        fontFamily: "Sora", fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    address,
                    style: const TextStyle(
                        fontFamily: "Sora",
                        fontSize: 16,
                        color: Color.fromARGB(255, 177, 177, 177)),
                  ),
                  kHieght5,
                  GestureDetector(
                    onTap: _editAddress,
                    child: Container(
                      height: height * 0.03,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, size: 15),
                          Text(
                            "Edit Address",
                            style: TextStyle(
                                fontFamily: "Sora",
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kHieght10,
                  const Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 156, 154, 154),
                    indent: 10,
                    endIndent: 0.0, // Modified line
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 10),
                        child: Container(
                          width: width * 0.23,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/chicken biriyani.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Chicken Biriyani",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      kWidth5,
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            color: Colors.white,
                            onPressed: () {
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  kHieght10,
                  const Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 156, 154, 154),
                    indent: 10,
                    endIndent: 0.0, // Modified line
                  ),
                  kHieght10,
                  GestureDetector(
                    onTap: _applyCoupon,
                    child: Container(
                      width: width,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: const Row(
                        children: [
                          kWidth10,
                          Image(
                            image: AssetImage("assets/images/discount.png"),
                            width: 35,
                            height: 35,
                          ),
                          kWidth5,
                          Text(
                            "Discount coupon is applied",
                            style: TextStyle(
                              fontFamily: "Sora",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  kHieght10,
                  const Text(
                    "Payment Summary",
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  kHieght10,
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$totalPrice",
                          style: const TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHieght10,
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery fee",
                          style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: isUPISelected
                                ? TextDecoration.lineThrough
                                : null,
                            decorationColor: Colors.white,
                          ),
                        ),
                        Text(
                          "$deliveryFee",
                          style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: isUPISelected
                                ? TextDecoration.lineThrough
                                : null,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHieght20,
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Grand Total :",
                          style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "\$$grandTotal",
                          style: const TextStyle(
                            fontFamily: "Sora",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHieght10,
                  const Center(
                    child: Text(
                      "Delivery Mode",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  kHieght10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _updatePaymentMode(true),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: isUPISelected ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.money),
                              Text(
                                "UPI",
                                style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: isUPISelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _updatePaymentMode(false),
                        child: Container(
                          width: width * 0.4,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: !isUPISelected ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.money),
                              Text(
                                "Cash on delivery",
                                style: TextStyle(
                                  fontFamily: "Sora",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: !isUPISelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel, color: Colors.white),
                label: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Sora",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 239, 150, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentPage()),
                  );
                },
                icon: const Icon(Icons.confirmation_num_outlined,
                    color: Colors.white),
                label: const Text(
                  "Confirm",
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
      ),
    );
  }
}
