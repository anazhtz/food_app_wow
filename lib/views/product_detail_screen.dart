import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_wow/model/food_model.dart';
import 'package:food_app_wow/provide/food_provider.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/check_out_details.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String amount;
  final double rating;

  const ProductDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.amount,
    required this.rating,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isExpanded = false;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final favoriteProvider = context.read<FavoriteItemProvider>();
    FavoriteItem currentItem = FavoriteItem(
      imagePath: widget.imagePath,
      title: widget.title,
      description: widget.description,
      amount: widget.amount,
    );
    isFavorite = favoriteProvider.wishfoods.contains(currentItem);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    final favoriteProvider = context.watch<FavoriteItemProvider>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        height: constraints.maxHeight * 0.3,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.03,
                          left: constraints.maxWidth * 0.03,
                          right: constraints.maxWidth * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white, size: 30),
                            ),
                            IconButton(
                              onPressed: () {
                                FavoriteItem currentItem = FavoriteItem(
                                  imagePath: widget.imagePath,
                                  title: widget.title,
                                  description: widget.description,
                                  amount: widget.amount,
                                );

                                if (!favoriteProvider.wishfoods
                                    .contains(currentItem)) {
                                  favoriteProvider.addToList(currentItem);
                                } else {
                                  favoriteProvider.removeFromList(currentItem);
                                }

                                // Update isFavorite based on the current state of wishfoods
                                setState(() {
                                  isFavorite = favoriteProvider.wishfoods
                                      .contains(currentItem);
                                });
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.05,
                            vertical: constraints.maxHeight * 0.09),
                        child: Column(
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.9,
                              height: constraints.maxHeight * 0.4,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(widget.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontFamily: "Sora",
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 206, 186, 2),
                                        size: 22,
                                      ),
                                      Text(
                                        widget.rating.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Sora",
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "(456)",
                                        style: TextStyle(
                                          fontFamily: "Sora",
                                          color: Colors.black45,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(
                                    color: Color.fromARGB(255, 144, 142, 142),
                                    thickness: .7,
                                  ),
                                  isExpanded
                                      ? Text(
                                          widget.description,
                                          style: const TextStyle(
                                            fontFamily: "Sora",
                                            color:
                                                Color.fromARGB(221, 73, 73, 73),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : Text(
                                          widget.description.length > 100
                                              ? "${widget.description.substring(0, 100)}..."
                                              : widget.description,
                                          style: const TextStyle(
                                            fontFamily: "Sora",
                                            color:
                                                Color.fromARGB(221, 73, 73, 73),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isExpanded =
                                            !isExpanded; // Toggle the value of isExpanded
                                      });
                                    },
                                    child: Text(
                                      isExpanded ? 'Read Less' : 'Read More',
                                      style: const TextStyle(
                                        color: OrangeButtonColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Size",
                                    style: TextStyle(
                                      fontFamily: "Sora",
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.15,
                                        height: constraints.maxHeight * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "S",
                                            style: TextStyle(
                                                fontFamily: "Sora",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: constraints.maxWidth * 0.15,
                                        height: constraints.maxHeight * 0.05,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 242, 176, 89),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 80, 79, 79)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "M",
                                            style: TextStyle(
                                                fontFamily: "Sora",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: constraints.maxWidth * 0.15,
                                        height: constraints.maxHeight * 0.03,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "L",
                                            style: TextStyle(
                                                fontFamily: "Sora",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            width: constraints.maxWidth * 0.998,
            height: constraints.maxHeight * 0.145,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 130, 128, 128).withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.amount,
                        style: const TextStyle(
                          fontFamily: "Sora",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 105),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 238, 230, 230),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: OrangeButtonColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CheckOutDetails()),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Buy Now",
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
