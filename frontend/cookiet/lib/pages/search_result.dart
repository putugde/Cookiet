import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final String _searchKey;
  SearchResult(this._searchKey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Search Result'),
        backgroundColor: Color(0xff021A2B),
      ),
      body: Container(
        color: Color(0xff00C6B5),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index) {
            return FoodHomeContent();
          },
        ),
      ),
    );
  }
}

class FoodHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffFFF7D6),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
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
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  width: MediaQuery.of(context).size.width-160,
                  // color: Colors.purpleAccent,
                  child: Text('NASI GORENG TELOR',style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                ),
                Container(
                  // color: Colors.cyan,
                  width: MediaQuery.of(context).size.width-160,
                  height: 64, 
                  child: Text('Nasi goreng paling enak di jagat raya, dibuat dengan cinta. Nasi goreng paling enak di jagat raya, dibuat dengan cinta. Nasi goreng paling enak di jagat raya, dibuat dengan cinta.', textAlign: TextAlign.left),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}