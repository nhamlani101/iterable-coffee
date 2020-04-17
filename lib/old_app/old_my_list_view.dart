import 'package:flutter/material.dart';
import 'old_suggested_product.dart';
import 'old_product.dart';

class MyListView extends StatelessWidget {
  final List<SuggestedProduct> prods;
  final Product product;

  MyListView(this.prods, this.product);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(product.pastPurchase, style: TextStyle(fontWeight: FontWeight.bold)),
      Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: prods.length,
              itemBuilder: (BuildContext content, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Name: " + prods[index].name),
                    Text("Description: " + prods[index].description),
                    Text("Price: " + prods[index].price.toString()),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider()))
    ]);
  }
}
