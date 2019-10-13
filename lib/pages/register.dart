import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static final TextEditingController _user = TextEditingController();
  static final TextEditingController _pass = TextEditingController();
  static final TextEditingController _email = TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;
  String get email => _email.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Email'),
              TextField(controller: _user, decoration: InputDecoration(
                hintText: 'Enter your email'
                ),
              ),
              Text('Username'),
              TextField(controller: _user, decoration: InputDecoration(
                hintText: 'Enter your username'
                ),
              ),
              Text('Password'),
              TextField(controller: _pass, decoration: InputDecoration(
                hintText: 'Enter your password'
                ), obscureText: true,
              ),
              RaisedButton(
                child: Text('Register'),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}