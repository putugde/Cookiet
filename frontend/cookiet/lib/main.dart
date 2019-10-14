import 'package:cookiet/pages/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cookiet/pages/login.dart';
import 'package:cookiet/pages/register.dart';
import 'package:cookiet/pages/home.dart';
import 'package:cookiet/pages/mood.dart';
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
         '/HomeTrue': (BuildContext context) => Home(true),
         '/HomeFalse': (BuildContext context) => Home(false),
         '/Mood': (BuildContext context) => Mood(),
         '/Refrigerator': (BuildContext context) => Refrigerator(),
        //  '/SearchResult/': (BuildContext context) => SearchResult('haha'),
      },
      home: Refrigerator(),
    );
  }
}