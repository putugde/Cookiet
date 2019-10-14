import 'package:flutter/material.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {
  void _addIngredients(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff021A2B),
        title: Text('Refrigerator')
      ),
      body: Container(
        color: Color(0xff00C6B5),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ListView.builder(
          itemCount: 10,      //INI DUMMY
          itemBuilder: (context,index){
            return Ingredient();
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 80,
        color: Color(0xff021A2B),
        child: BottomAppBar(
          child: RaisedButton(
            color: Color(0xffFFF7D6),
            child: Icon(Icons.add, color: Color(0xff021A2B),),
            onPressed: _addIngredients,
          )
        ),
      ),
    );
  }
}

class Ingredient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFFF7D6),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/ayam_broiler.jpg'),
              )
            ),
          ),
          Container(
            // color: Colors.purpleAccent,
            alignment: Alignment(0,0),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 80,
            constraints: BoxConstraints(maxWidth: 200),
            child: Text('Ayam Broiler\n(200 gram)',style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment(0,0),
            width: 50,
            // color: Colors.orange,
            height: 80,
            child: Text('200', style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),textAlign:TextAlign.center,),
          ),
        ],
      ),
    );
  }
}