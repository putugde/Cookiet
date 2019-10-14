import 'package:flutter/material.dart';
import 'package:cookiet/pages/search_result.dart';

class Details extends StatefulWidget {
  static String tag = 'detail-page';
  @override
  _DetailsState createState() => _DetailsState();
}

final titleLabel = FlatButton(
  child: Text(
    'Nasi  Goreng',
    style: TextStyle(
      color: Colors.black54
    ),
  ),
  onPressed: () {},
);

class _DetailsState extends State<Details> { 
  // static var _searchIcon = Icons.search;
  // static var _title = Container(child:Text('COOKIET',style: TextStyle(color: Colors.white,)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00C6B5),
      appBar: AppBar(
        backgroundColor:  Color(0xff021A2B),   //diganti
        elevation: 1.0,
        title: Text('NASI GORENG'),
      ),
      body: DetailsBody(),
      bottomNavigationBar: Container(
        color: Color(0xff021A2B),
        height: 50,
        alignment: Alignment.center,
        child: BottomAppBar(
          color: Color(0xff021A2B),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,color: Colors.white,),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.kitchen,color: Colors.white),
                onPressed: () {Navigator.of(context).pushNamed('/Refrigerator');},
              ),
              IconButton(
                icon: Icon(Icons.account_circle,color: Colors.white),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsBody extends StatefulWidget {
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: Color(0xff00C6B5),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index) {
          // if (index.isOdd) return Divider(color: Colors.red);
          return FoodDetailContent();
        },
      ),
    );
  }
}

class FoodDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: EdgeInsets.fromLTRB(10, 40, 10, 50),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFFF7D6),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/food_dummy.jpg'),
              )
            ),
          ),
          Container(
            // color: Colors.yellow,
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  width: MediaQuery.of(context).size.width-160,
                  // color: Colors.purpleAccent,
                  child: Text('INGREDIENTS',style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ),
                Container(
                  // color: Colors.cyan,
                  width: MediaQuery.of(context).size.width-160,
                  height: 64, 
                  child: Text('1. Nasi\n2. Bumbu\n3. Minyak', textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  width: MediaQuery.of(context).size.width-160,
                  child: Text(
                    'STEPS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-160,
                  height: 64,
                  child: Text(
                    '1. Put Some Rice\n2. Eat',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}