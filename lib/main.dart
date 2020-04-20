import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_app/models/cart_model.dart';
import 'package:flutter_test_app/screens/cart.dart';
import 'package:flutter_test_app/screens/catalog.dart';
import 'package:flutter_test_app/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  //StreamSubscription iosSubscrption;

  @override
  void initState() {
    super.initState();
    // if (Platform.isIOS) {
    //   iosSubscrption = _fcm.onIosSettingsRegistered.listen((data) {
    //     _saveDeviceToken();
    //   });
    //   _fcm.requestNotificationPermissions(IosNotificationSettings());
    // } else {
    //   _saveDeviceToken();
    // }

    _fcm.configure(onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    });
    _saveDeviceToken();
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    print("DEVICE TOKEN: $fcmToken");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        color: Color(0xFF34C3F2),
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
