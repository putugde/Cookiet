import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static final TextEditingController _user = TextEditingController();
  static final TextEditingController _pass = TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(32.0),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Column(
            children: <Widget>[
              Image.asset('images/chefhat.jpg'),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    Align(child: Text('PELER'),alignment: Alignment.centerLeft,),
                    TextField(
                      controller: _user,
                      decoration: InputDecoration(hintText: 'Enter your username'),
                    ),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Align(child: Text('Password'),alignment: Alignment.centerLeft,),
                    TextField(
                      controller: _user,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                      ),
                      obscureText: true,
                    ),
                  ]
                ),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: null,
              )
            ],
          ),
        )
      ),
    );
  }
}
