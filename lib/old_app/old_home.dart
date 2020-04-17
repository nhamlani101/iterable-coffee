import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'old_product.dart';
import 'old_my_list_view.dart';
import 'old_iterable_functions.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  Future<Product> futureProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(title: Text("Iterable Flutter Test")),
      body: Container(
        child: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MyListView(
                    snapshot.data.suggestedProducts, snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            trackEvent();
            print(context);
            final snackBar = SnackBar(content: Text('You tracked an event'));
            _key.currentState.showSnackBar(snackBar);
          },
          label: Text("Track"),
          icon: Icon(Icons.add)),
    );
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
  }
}

Future<Product> fetchProducts() async {
  final response = await http.get(
      'https://static.iterable.com/sample-data-feeds/sample_data_feed.json');
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Product.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
