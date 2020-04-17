import 'package:flutter/material.dart';

@immutable
class Item {
  final String itemName;
  final double price;
  final String imageUrl;

  Item(this.itemName, this.price, this.imageUrl);

  @override
  String toString() {
    String myIdHash =
        price.toStringAsFixed(0) + itemName.substring(itemName.length - 3);
    return """
    {
      "id": "$myIdHash",
      "name": "$itemName",
      "price": $price,
      "quantity": 1
    }
    """;
  }
}
