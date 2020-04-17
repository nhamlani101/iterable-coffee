import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Iterable Bottle Coffee',
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('ENTER'),
                onPressed: () {
                  print("Enter button pressed");
                  Navigator.pushReplacementNamed(context, '/catalog');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
