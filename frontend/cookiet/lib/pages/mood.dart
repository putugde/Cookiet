import 'package:flutter/material.dart';

class Mood extends StatelessWidget {

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
              Navigator.of(context).pushNamedAndRemoveUntil('/HomeTrue', (Route<dynamic> route) => false);
            },),),
            VerticalDivider(color: Color(0xffFFF7D6),),
            Expanded(child: IconButton(icon: Icon(Icons.event_seat, size: 50,color: Color(0xffFFF7D6),), onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/HomeFalse', (Route<dynamic> route) => false);
            }),),
          ],
        ),
      ),
    );
  }
}