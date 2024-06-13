import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  int quantity;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    // Check if the item is already in the cart
    final index = _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (index >= 0) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    final index = _items.indexWhere((cartItem) => cartItem.name == item.name);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  void removeItem(CartItem item) {
    _items.removeWhere((cartItem) => cartItem.name == item.name);
    notifyListeners();
  }
}
