import 'package:flutter/material.dart';
import 'package:cookiet/api/search_api.dart';

class SearchResult extends StatelessWidget {
  final String _searchKey;
  static List queryResultList;
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
        child: FutureBuilder(
          future: SearchResultAPI.getList(_searchKey),
          builder: (context, snapshot){
            if (snapshot.error != null){
              return Center(child: Text('No Internet Access',style: TextStyle(color: Color(0xff021A2B)),));
            }
            queryResultList = null;
            queryResultList = List();
            queryResultList = SearchResultAPI.list;
            return ListView.builder(
              itemCount: queryResultList.length,
              itemBuilder: (context,index) {
                return FoodHomeContent(queryResultList[index]);
              }
            );
          }
        )
        
        
      ),
    );
  }
}

class FoodHomeContent extends StatelessWidget {
  final RecipeData recipe;

  FoodHomeContent(this.recipe);

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
                image: NetworkImage('https://www.etheral.id/assets/recipes/${recipe.id}.jpeg'),
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
                  child: Text(recipe.nama.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                ),
                Container(
                  // color: Colors.cyan,
                  width: MediaQuery.of(context).size.width-160,
                  height: 64, 
                  child: Text(recipe.desc, textAlign: TextAlign.left),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}