import 'package:flutter/foundation.dart';

import 'item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> cartItems = [];
  String _email;

  void setEmail(String email) {
    _email = email;
  }

  String get getEmail {
    return _email;
  }

  /// The current total price of all items.
  double get totalPrice {
    double sum = 0;
    cartItems.forEach((Item i) {
      sum += i.price;
    });
    return sum;
  }

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    cartItems.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    cartItems.remove(item);
    notifyListeners();
  }

  int get getLength {
    return cartItems.length;
  }

  void clearAll() {
    cartItems.clear();
  }

  Item getByPosition(int position) {
    return cartItems[position];
  }

  bool doesContain(Item item) {
    return cartItems.contains(item);
  }

  List<Item> get getCurrentCart {
    return cartItems;
  }
}
