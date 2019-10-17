import 'package:cookiet/api/register_api.dart';
import 'package:cookiet/pages/mood.dart';
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

    void _showDialogFailedRegister() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Register Failed"),
          content: new Text("Username has been taken, or no internet access."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCircularLoading() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please Wait"),
          content: new Text("Please wait, register is in progress"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new CircularProgressIndicator(),
          ],
        );
      },
    );
  }

    final titleApp = FlatButton(
      child: Text(
        'REGISTER COOKIET',
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
          onPressed: () async {
            _showCircularLoading();
            var loginInfo = await RegisterAPI.register(_user.text, _email.text, _pass.text);
            if (loginInfo.success){
              Navigator.of(context).pop();
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mood(loginInfo),
                ),
              );
            } else {
              Navigator.of(context).pop();
              _showDialogFailedRegister();
              _user.clear();
              _email.clear();
              _pass.clear();
            }
          },
          // color: Colors.yellow,
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final accountLabel = FlatButton(
      child: Text(
        'Already have an account? Login here !',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/Login', (Route<dynamic>route) => false);
      },
    );

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
