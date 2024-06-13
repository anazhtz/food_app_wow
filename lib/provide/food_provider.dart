import 'package:flutter/material.dart';
import 'package:food_app_wow/model/food_model.dart';


final List<FavoriteItem> data = List.generate(
    100,
        (index) => FavoriteItem(imagePath: '', title: '', amount: '', description: ''));

class FavoriteItemProvider with ChangeNotifier {
  final List<FavoriteItem> movieHome = data;

  List<FavoriteItem> get foodies => movieHome; // retrive all the movies

  final List<FavoriteItem> foodlist = [];    //  fetch list from wishlist

  List<FavoriteItem> get wishfoods => foodlist;

  void addToList(FavoriteItem movie){
    foodlist.add(movie);
    notifyListeners();
  }

  void removeFromList(FavoriteItem movie){
    foodlist.remove(movie);
    notifyListeners();
  }

}