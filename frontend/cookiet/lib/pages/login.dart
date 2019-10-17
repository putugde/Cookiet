import 'package:cookiet/api/login_api.dart';
import 'package:flutter/material.dart';
import 'package:cookiet/pages/mood.dart';

// import 'package:login/home_page.dart';

class Login extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  static final TextEditingController _user = TextEditingController();
  static final TextEditingController _pass = TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;

  void _showDialogFailedLogin() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Failed"),
          content: new Text("Invalid Credentials"),
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

  void _showCircularLoadingLogin() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Logging In"),
          content: new Text("Please wait..."),
          actions: <Widget>[
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
  
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
        'COOKIET',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 42
        ),
      ),
      onPressed: null,
    );

    final unameBox = TextFormField(
      // keyboardType: TextInputType.emailAddress,
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

    final loginButton = Padding(
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
            _showCircularLoadingLogin();
            LoginInfo loginInfo = await LoginAPI.login(_user.text, _pass.text);
            // print(loginInfo);
            if (loginInfo.success) {  
              Navigator.of(context).pop();
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mood(loginInfo),
                ),
              );
            } else {
              Navigator.of(context).pop();
              _showDialogFailedLogin();
            }
            _user.clear();
            _pass.clear();
          },
          // color: Colors.yellow,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final registerLabel  = FlatButton(
      child: Text(
        'Dont have account? Register here!!!',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/Register', (Route<dynamic>route) => false);
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
            unameBox,
            SizedBox(height: 20.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerLabel
          ],
        ),
      ),
    );
  }
}