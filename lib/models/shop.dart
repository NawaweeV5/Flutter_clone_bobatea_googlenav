import 'package:boba_milk_tea/models/drink.dart';
import 'package:flutter/material.dart';

class BobaTeaShop extends ChangeNotifier {
  // list of drinks for sales
  final List<Drink> _shop = [
    Drink(
        name: "Boba Milk Tea",
        price: "59",
        imagepath: "lib/images/bobatea.png"),
  ];
  // list of drinks in users cart
  final List<Drink> _userCart = [];
  // get drinks for sale
  List<Drink> get shop => _shop;
  // get users cart
  List<Drink> get cart => _userCart;
  // add drinks to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drinks from cart
  void removeCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
