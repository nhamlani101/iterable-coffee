import 'old_suggested_product.dart';

class Product {
  String pastPurchase;
  List<SuggestedProduct> suggestedProducts;

  Product({this.pastPurchase, this.suggestedProducts});

  factory Product.fromJson(Map<String, dynamic> json) {
    var productsFromJson = json['suggestedProduct'] as List;
    List<SuggestedProduct> mData =
        productsFromJson.map((i) => SuggestedProduct.fromJson(i)).toList();

    return Product(
        pastPurchase: json['pastPurchase'], suggestedProducts: mData);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pastPurchase'] = this.pastPurchase;
    if (this.suggestedProducts != null) {
      data['suggestedProduct'] =
          this.suggestedProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
