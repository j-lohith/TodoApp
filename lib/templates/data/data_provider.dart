import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  addCartDetails(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  deleteCardDetails(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
