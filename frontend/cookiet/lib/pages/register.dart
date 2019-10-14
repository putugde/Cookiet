import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  static final TextEditingController _user = TextEditingController();
  static final TextEditingController _pass = TextEditingController();
  static final TextEditingController _email = TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;
  String get email => _email.text;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo.png'),
      ),
    );

    final titleApp = FlatButton(
      child: Text(
        'Register Cookiet',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 24
        ),
      ),
      onPressed: null,
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email Address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _user,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: _pass,
      // initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Color(0xff021A2B),
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          // color: Colors.yellow,
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/Mood', (Route<dynamic>route) => false);
          },
          // color: Colors.yellow,
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final accountLabel = FlatButton(
      child: Text(
        'Already have an account? Login here!!!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    // final registerLabel  = FlatButton(
    //   child: Text(
    //     'Dont have account? Register here!!!',
    //     style: TextStyle(color: Colors.black54),
    //   ),
    //   onPressed: () {
    //     Navigator.of(context).pushNamed('/Register');
    //   },
    // );

    return Scaffold(
      backgroundColor: Color(0xfffff7D6),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            titleApp,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 20.0),
            username,
            SizedBox(height: 20.0),
            password,
            SizedBox(height: 24.0),
            registerButton,
            accountLabel
            // forgotLabel,
            // registerLabel
          ],
        ),
      ),
    );
  }
}
