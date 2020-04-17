import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_app/models/cart_model.dart';
import 'package:flutter_test_app/screens/cart.dart';
import 'package:flutter_test_app/screens/catalog.dart';
import 'package:flutter_test_app/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Provider Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
