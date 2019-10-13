import 'package:flutter/material.dart';
import 'package:cookiet/pages/login.dart';
import 'package:cookiet/pages/register.dart';
import 'package:cookiet/pages/home.dart';

void main() => runApp(Cookiet());

class Cookiet extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Cookiet',
      routes: <String,WidgetBuilder>{
         '/Login': (BuildContext context) => Login(),
         '/Register': (BuildContext context) => Register(),
         '/Home': (BuildContext context) => new Home(),
      },
      home: Home(),
    );
  }
}