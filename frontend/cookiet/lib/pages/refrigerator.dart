import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Refrigerator extends StatefulWidget {
  

  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {
  void _addIngredients(){

  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff021A2B),
        title: Text('Refrigerator')
      ),
      body: SlidingUpPanel(
        backdropEnabled: true,
        panel: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff021A2B),
            borderRadius: radius
          ),
          child: 
          Column(
            children: <Widget>[
              Icon(Icons.dehaze,color: Color(0xffFFF7D6),size: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: RaisedButton(
                  color: Color(0xff00c6b5),
                  child: Text('Add Ingredients',style: TextStyle(fontSize: 23,color: Color(0xff021a2b)),),
                  onPressed: _addIngredients,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                height: 375,
                child: ListView.builder(
                  itemCount: 10,      //INI DUMMY
                  itemBuilder: (context,index){
                    return AddIngredient();
                  },
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Color(0xff021A2B),
            borderRadius: radius
          ),
          child: Container(
            alignment: Alignment(0,0),
            child: Icon(Icons.add, color: Color(0xffFFF7D6),size: 50,),
          ),
        ),
        body: Container(
          color: Color(0xff00C6B5),
          padding: EdgeInsets.fromLTRB(15, 0, 15, 140),
          child: ListView.builder(
            itemCount: 10,      //INI DUMMY
            itemBuilder: (context,index){
              return Ingredient();
            },
          ),
        ),
        borderRadius: radius,
        minHeight:60
      ) 
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
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment(0,0),
            width: 50,
            // color: Colors.orange,
            height: 80,
            child: Text('200', style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),textAlign:TextAlign.center,),
          ),
        ],
      ),
    );
  }
}

class AddIngredient extends StatelessWidget {
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
          VerticalDivider(color: Color(0xff021A2B),width: 16),
          Container(
            // color: Colors.purpleAccent,
            alignment: Alignment(0,0),
            height: 80,
            constraints: BoxConstraints(maxWidth: 150),
            child: Text('Ayam Broiler\n(200 gram)',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),textAlign: TextAlign.center,),
          ),
          VerticalDivider(color: Color(0xff021A2B),width: 16,),
          Container(
            alignment: Alignment(0,0),
            width: 60,
            // color: Colors.orange,
            height: 80,
            child: Column(
              children: <Widget>[
                Text('200', style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),textAlign:TextAlign.center,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 25,
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: RaisedButton(
                        color: Color(0xff00c6b5),
                        child: Icon(Icons.add,color: Color(0xff021A2B),),
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 25,
                      child: RaisedButton(
                        color: Color(0xff00c6b5),
                        padding: EdgeInsets.all(0),
                        child: Icon(Icons.remove,color: Color(0xff021A2B)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
