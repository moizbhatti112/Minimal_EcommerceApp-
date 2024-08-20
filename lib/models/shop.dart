import 'package:ecom_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> shop = [
    Product(
        name: 'Glasses',
        description: "Glasses, also known as eyeglasses or spectacles ",
        price: 99.99,
        imagepath: "assets/images/glasses.png"),
    Product(
        name: 'Cap',
        description: "A common type of hat",
        price: 99.99,
        imagepath: 'assets/images/cap.png'),
    Product(
        name: 'Shirt',
        description: "A casual shirt without a collar ",
        price: 99.99,
        imagepath: 'assets/images/shirt.png'),
    Product(
        name: 'Watch',
        description: "Portable timepiece",
        price: 99.99,
        imagepath: 'assets/images/watch.png'),
  ];
  List<Product> cart = [];

  List<Product> get shp => shop;

  List<Product> get crt => cart;

  void removeFromCart(Product item) {
    cart.remove(item);
    notifyListeners();
  }

  void addToCart(Product item) {
    cart.add(item);
    notifyListeners();
  }
}
