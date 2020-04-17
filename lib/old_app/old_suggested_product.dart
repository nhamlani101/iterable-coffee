class SuggestedProduct {
  String name;
  String description;
  int price;
  String imageUrl;

  SuggestedProduct({this.name, this.description, this.price, this.imageUrl});

  factory SuggestedProduct.fromJson(Map<String, dynamic> json) {
    return SuggestedProduct(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
