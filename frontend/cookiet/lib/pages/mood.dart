import 'package:cookiet/api/login_api.dart';
import 'package:flutter/material.dart';
import 'package:cookiet/pages/home.dart';

class Mood extends StatelessWidget {
  final LoginInfo userInfo;
  
  Mood(this.userInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color(0xff00C6B5),
      body: Container(
        margin: EdgeInsets.fromLTRB(25, 250, 25, 250),
        decoration: BoxDecoration(
          color: Color(0xff021A2B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.flash_on, size: 50,color: Color(0xffFFF7D6),), onPressed: () {
              
              // Navigator.push(
              // context,
              // MaterialPageRoute(
              //   builder: (context) => Mood(loginInfo),
              //   ),
              // );
              
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) => Home(true,this.userInfo)
              ), (Route<dynamic> route) => false);

              // Navigator.of(context).pushNamedAndRemoveUntil('/HomeTrue', (Route<dynamic> route) => false);

            },),),
            VerticalDivider(color: Color(0xffFFF7D6),),
            Expanded(child: IconButton(icon: Icon(Icons.event_seat, size: 50,color: Color(0xffFFF7D6),), onPressed: (){
              
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) => Home(false,this.userInfo)
              ), (Route<dynamic> route) => false);

              // Navigator.of(context).pushNamedAndRemoveUntil('/HomeFalse', (Route<dynamic> route) => false);

            }),),
          ],
        ),
      ),
    );
  }
}