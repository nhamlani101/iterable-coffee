import 'package:flutter/material.dart';
import 'package:iterable_coffee/models/cart_model.dart';
import 'package:iterable_coffee/util/iterable_functions.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({
    Key key,
  }) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<CartModel>(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Iterable Bottle Coffee',
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Color(0xFF34C3F2),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              color: Color(0xFF34C3F2),
              child: Text('Login'),
              onPressed: () {
                print("Enter button pressed");
                if (_formKey.currentState.validate()) {
                  print("validated");
                  info.setEmail(emailController.text);
                  updateUser(emailController.text).then((result) {
                    if (result.statusCode == 200) {
                      print("User updated");
                      Navigator.pushReplacementNamed(context, '/catalog');
                    } else {
                      print(result.body);
                      print(result.statusCode);
                      throw Exception("It didn't work");
                    }
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }

  String validateEmail(value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
