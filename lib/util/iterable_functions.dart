import 'dart:convert';

import 'package:flutter_test_app/models/item.dart';
import 'package:http/http.dart' as http;

trackEvent() async {
  final http.Response response = await http.post(
    'https://api.iterable.com/api/events/track',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Api-Key': 'd5b52cd48d974cf5a5e79c7790c64b17'
    },
    body: jsonEncode(<String, String>{
      'email': 'noman.hamlani@iterable.com',
      'eventName': 'flutterEvent'
    }),
  );
  if (response.statusCode == 200) {
    print("OMG YOU DID IT");
  } else {
    throw Exception("It didn't work");
  }
}

updateCart(String email, List<Item> items) async {
  print(makeJson(email, items));
  final http.Response response = await http.post(
    'https://api.iterable.com/api/commerce/updateCart',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Api-Key': 'd5b52cd48d974cf5a5e79c7790c64b17'
    },
    body: makeJson(email, items),
  );
  if (response.statusCode == 200) {
    print("You updated the CART");
  } else {
    print(response.body);
    print(response.statusCode);
    throw Exception("It didn't work");
  }
}

trackPurchase(String email, List<Item> items, double total) async {
  print(makeJson(email, items, total: total));
  final http.Response response = await http.post(
    'https://api.iterable.com/api/commerce/trackPurchase',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Api-Key': 'd5b52cd48d974cf5a5e79c7790c64b17'
    },
    body: makeJson(email, items, total: total),
  );
  if (response.statusCode == 200) {
    print("You made a PURCHASE");
  } else {
    print(response.body);
    print(response.statusCode);
    throw Exception("It didn't work");
  }
}

Future<http.Response> updateUser(String email) async {
  print("updating user: " + email);
  final http.Response response = await http.post(
      'https://api.iterable.com/api/users/update',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Api-Key': 'd5b52cd48d974cf5a5e79c7790c64b17'
      },
      body: '''
    {
      "email": "$email"
    }
    ''');
  print(response.statusCode.toString());
  return response;
}

String makeJson(String email, List<Item> items, {double total}) {
  String mJson = '''
  {
    "user": {
      "email": "$email"
    },
    "items": [  
  ''';

  for (var i = 0; i < items.length; i++) {
    mJson += items[i].toString();
    print(i);
    if (i != items.length - 1) {
      mJson += ",";
    }
  }
  mJson += "]";
  if (total != null) {
    mJson += ''',"total" : $total''';
  }
  mJson += "}";
  return mJson;
}
