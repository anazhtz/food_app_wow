import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_app_wow/provide/shoppingcart_provider.dart';
import 'package:food_app_wow/utils/const.dart';
import 'package:food_app_wow/views/favorite_screen.dart';
import 'package:food_app_wow/views/notification_screen.dart';
import 'package:food_app_wow/views/product_detail_screen.dart';
import 'package:food_app_wow/views/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class OfferDetails {
  final String imagePath;
  final String offerText;
  final String offerAmount;

  OfferDetails({
    required this.imagePath,
    required this.offerText,
    required this.offerAmount,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavIndex = 0;
  late PageController _pageController;

  final ScrollController _scrollController = ScrollController();

  final List<Widget> screens = [
    const HomeScreenContent(),
    const FavoriteScreen(),
    const ShoppingCart(),
    const NotificationScreen(),
  ];
  Color _backgroundColor = Colors.white;
  Color _iconColor = Colors.black;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: bottomNavIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            bottomNavIndex = index;
            _updateColors();
          });
        },
        itemCount: screens.length,
        itemBuilder: (context, index) => screens[index],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: _backgroundColor, // Background color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Spread color
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 70,
        child: SalomonBottomBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: _iconColor,
          backgroundColor: Colors.transparent,
          currentIndex: bottomNavIndex,
          onTap: (index) {
            setState(() {
              bottomNavIndex = index;
              _updateColors();
            });
            _pageController.jumpToPage(index);
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text("Home"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.favorite,
                size: 30,
              ),
              title: const Text("Favorite"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              title: const Text("Cart"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.notifications,
                size: 30,
              ),
              title: const Text("Notifications"),
            ),
          ],
        ),
      ),
    );
  }

  void _updateColors() {
    switch (bottomNavIndex) {
      case 0:
        setState(() {
          _backgroundColor = Colors.white;
          _iconColor = Colors.black;
        });
        break;
      case 1:
        setState(() {
          _backgroundColor = Colors.black;
          _iconColor = Colors.white;
        });
        break;
      case 2:
        setState(() {
          _backgroundColor = Colors.black;
          _iconColor = Colors.white;
        });
        break;
      case 3:
        setState(() {
          _backgroundColor = Colors.black;
          _iconColor = Colors.white;
        });
        break;
    }
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  final List<OfferDetails> offerDetails = [
    OfferDetails(
      imagePath: 'assets/images/indian food moody photography.jpeg',
      offerText: '50% OFF',
      offerAmount: 'Rs 399/-',
    ),
    OfferDetails(
      imagePath: 'assets/images/kabaab.jpg',
      offerText: '30% OFF',
      offerAmount: 'Rs 299/-',
    ),
    OfferDetails(
      imagePath: 'assets/images/Maydan.jpg',
      offerText: '20% OFF',
      offerAmount: 'Rs 199/-',
    ),
    OfferDetails(
      imagePath:
          'assets/images/Delicious traditional biryani pakistani or indian food.jpg',
      offerText: '40% OFF',
      offerAmount: 'Rs 449/-',
    ),
  ];

  final List<String> categories = [
    'Non Veg',
    'Vegetarian',
    'Special Dish',
    'Alfaham Dish',
    'Biriyani',
  ];

  final int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < offerDetails.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  height: 330,
                  width: double.infinity,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontWeight: FontWeight.w300,
                          color: Colors.white60,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Kozhikode, India',
                            style: TextStyle(
                              fontFamily: "Sora",
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 55,
                        child: CupertinoSearchTextField(
                          backgroundColor: Color.fromARGB(255, 56, 55, 55),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.white60,
                          ),
                          placeholder: 'Search food',
                          placeholderStyle: TextStyle(
                            color: Colors.white60,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    margin: const EdgeInsets.only(top: 160.0),
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: offerDetails.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(offerDetails[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Container(
                                  height: 160,
                                  width: 23,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                    child: Text(
                                      offerDetails[index].offerText,
                                      style: const TextStyle(
                                        fontFamily: "Sora",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        const Text(
                                          'Only',
                                          style: TextStyle(
                                            fontFamily: "Sora",
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        Text(
                                          offerDetails[index].offerAmount,
                                          style: const TextStyle(
                                            fontFamily: "Sora",
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  return CategoryButton(
                      text: categories[index],
                      isSelected: _selectedCategoryIndex == index,
                      onTap: () {});
                }),
              ),
            ),
            const SizedBox(height: 15),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCard(
                              imagePath: "assets/images/Chilli Chicken.jpeg",
                              title: "Chicken Chilly",
                              description:
                                  "Chilli Chicken is a popular Indo-Chinese dish that features crispy marinated boneless chicken sautéed with onions, bell peppers, and flavorful Chinese sauces. It can be enjoyed as a dry appetizer or as a gravy with rice, noodles, or fried rice",
                              amount: "250/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/beef biriyani.jpeg",
                              title: "Mutton Biriyani",
                              description:
                                  "Mutton biryani, a beloved dish that tantalizes the senses, is a symphony of flavors and textures. Picture this: tender chunks of marinated mutton, nestled between layers of fragrant basmati rice. The aroma of cinnamon, cardamom, and cloves dances in the air, infusing every grain. Slow-cooked to perfection in the traditional dum style, it emerges from the pot adorned with crispy fried onions—a feast fit for royalty. 🍽️🔥.",
                              amount: "300/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/chicken biriyani.jpeg",
                              title: "Chicken Biriyani",
                              description:
                                  "Chicken Biryani, a highly aromatic and well-seasoned one-pot dish, is a staple of Indian cuisine. It needs no introduction—it has delighted palates for generations at community feasts, family gatherings, and in almost every Indian household",
                              amount: "350/-",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCard(
                              imagePath: "assets/images/Chilli Chicken.jpeg",
                              title: "Chicken Chilly",
                              description:
                                  "Chilli Chicken is a popular Indo-Chinese dish that features crispy marinated boneless chicken sautéed with onions, bell peppers, and flavorful Chinese sauces. It can be enjoyed as a dry appetizer or as a gravy with rice, noodles, or fried rice",
                              amount: "250/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/beef biriyani.jpeg",
                              title: "Mutton Biriyani",
                              description:
                                  "Mutton biryani, a beloved dish that tantalizes the senses, is a symphony of flavors and textures. Picture this: tender chunks of marinated mutton, nestled between layers of fragrant basmati rice. The aroma of cinnamon, cardamom, and cloves dances in the air, infusing every grain. Slow-cooked to perfection in the traditional dum style, it emerges from the pot adorned with crispy fried onions—a feast fit for royalty. 🍽️🔥.",
                              amount: "300/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/chicken biriyani.jpeg",
                              title: "Chicken Biriyani",
                              description:
                                  "Chicken Biryani, a highly aromatic and well-seasoned one-pot dish, is a staple of Indian cuisine. It needs no introduction—it has delighted palates for generations at community feasts, family gatherings, and in almost every Indian household",
                              amount: "350/-",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FoodCard(
                              imagePath: "assets/images/Chilli Chicken.jpeg",
                              title: "Chicken Chilly",
                              description:
                                  "Chilli Chicken is a popular Indo-Chinese dish that features crispy marinated boneless chicken sautéed with onions, bell peppers, and flavorful Chinese sauces. It can be enjoyed as a dry appetizer or as a gravy with rice, noodles, or fried rice",
                              amount: "250/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/beef biriyani.jpeg",
                              title: "Mutton Biriyani",
                              description:
                                  "Mutton biryani, a beloved dish that tantalizes the senses, is a symphony of flavors and textures. Picture this: tender chunks of marinated mutton, nestled between layers of fragrant basmati rice. The aroma of cinnamon, cardamom, and cloves dances in the air, infusing every grain. Slow-cooked to perfection in the traditional dum style, it emerges from the pot adorned with crispy fried onions—a feast fit for royalty. 🍽️🔥.",
                              amount: "300/-",
                            ),
                            FoodCard(
                              imagePath: "assets/images/chicken biriyani.jpeg",
                              title: "Chicken Biriyani",
                              description:
                                  "Chicken Biryani, a highly aromatic and well-seasoned one-pot dish, is a staple of Indian cuisine. It needs no introduction—it has delighted palates for generations at community feasts, family gatherings, and in almost every Indian household",
                              amount: "350/-",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? OrangeButtonColor : Colors.transparent,
            border: Border.all(
              color: isSelected ? OrangeButtonColor : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "Sora",
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String amount;
  final double rating;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.amount,
    this.rating = 4.9,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imagePath: imagePath,
              title: title,
              description: description,
              amount: amount,
              rating: rating,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 226, 222, 222),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 40, left: 5),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5), // Adjust the spacing here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Sora",
                    color: Color.fromARGB(180, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2), // Adjust the spacing here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 110, // Set a fixed width
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis, // Ensure ellipsis is used
                    maxLines: 2, // Limit to 2 lines
                    style: const TextStyle(
                      fontFamily: "Sora",
                      color: Color.fromARGB(139, 0, 0, 0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2), // Adjust the spacing here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/rupees.png"),
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      amount,
                      style: const TextStyle(
                        fontFamily: "Sora",
                        color: Color.fromARGB(180, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 10,
            child: GestureDetector(
              onTap: () {
                final item = CartItem(
                  name: title,
                  description: description,
                  price: double.parse(amount.replaceAll('/-', '')),
                  imagePath: imagePath,
                );
                context.read<CartProvider>().addItem(item);
              },
              child: const Image(
                image: AssetImage("assets/images/icons8-add-50.png"),
                width: 35,
                height: 35,
                color: OrangeButtonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

