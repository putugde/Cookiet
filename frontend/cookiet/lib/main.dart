import 'package:cookiet/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cookiet/pages/login.dart';
import 'package:cookiet/pages/register.dart';
import 'package:cookiet/pages/refrigerator.dart';

void main() => runApp(Cookiet());

class Cookiet extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Cookiet',
      routes: <String,WidgetBuilder>{
         '/Login': (BuildContext context) => Login(),
         '/Register': (BuildContext context) => Register(),
        //  '/Refrigerator': (BuildContext context) => Refrigerator(),
      },
      home: Login(),
    );
  }
}