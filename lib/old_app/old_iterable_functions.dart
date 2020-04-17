import 'dart:convert';

import 'package:http/http.dart' as http;

void testEvent() {
  print("testing events");
}

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
