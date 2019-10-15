import 'package:cookiet/api/home_api.dart';
import 'package:cookiet/api/login_api.dart';
import 'package:cookiet/pages/details.dart';
import 'package:cookiet/pages/refrigerator.dart';
import 'package:flutter/material.dart';
import 'package:cookiet/pages/search_result.dart';

class Home extends StatefulWidget {
  final LoginInfo userInfo;
  final bool excited;

  Home(this.excited,this.userInfo);

  @override
  _HomeState createState() => _HomeState(this.excited, this.userInfo);
}

class _HomeState extends State<Home> { 
  static var _searchIcon = Icons.search;
  final LoginInfo userInfo;
  static var _title = Container(child:Text('COOKIET',style: TextStyle(color: Colors.white,)));
  final TextEditingController _query = TextEditingController();
  final bool excited;
  _HomeState(this.excited, this.userInfo);

  void _onPressedSearch(){
    setState(() {
      if (_searchIcon == Icons.search) {
        _searchIcon = Icons.close;
        _title = Container(child: TextField(
          autofocus: true,
          controller: _query,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search...',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(
            color: Colors.white
          ),
          onSubmitted: (text) {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResult(text),
              ),
            );
            _query.clear();
            _searchIcon = Icons.search;
            _title = Container(child:Text('COOKIET',style: TextStyle(color: Colors.white,)));
          },
        ),);
      } else {
        _searchIcon = Icons.search;
        _title = Container(child:Text('COOKIET',style: TextStyle(color: Colors.white,)));
        _query.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00C6B5),
      appBar: AppBar(
        backgroundColor:  Color(0xff021A2B),   //diganti
        elevation: 1.0,
        title: _title,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child:  IconButton (
              icon: Icon(_HomeState._searchIcon,color: Colors.white,),
              onPressed: () {
                _onPressedSearch();
              } ,
            )
          )
        ],
      ),
      body: HomeBody(excited,this.userInfo),
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
                onPressed: () {

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Refrigerator(this.userInfo),
                    ),
                  );
                  Navigator.of(context).pushNamed('/Refrigerator');
                },
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

class HomeBody extends StatefulWidget {
  final bool exc;
  final LoginInfo userInfo;


  HomeBody(this.exc, this.userInfo);
  @override
  _HomeBodyState createState() => _HomeBodyState(exc, this.userInfo);
}

class _HomeBodyState extends State<HomeBody> {
  final bool exc;
  final LoginInfo userInfo;

  _HomeBodyState(this.exc, this.userInfo);


  @override
  Widget build(BuildContext context) {
    int mood = exc?1:0;
    return Container(
      // color: Colors.green,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: Color(0xff00C6B5),
      child: FutureBuilder(
        future: HomeAPI.getRecommendation(this.userInfo.idCust, mood),
        builder: (context, snapshot) {
          print(this.userInfo.idCust);
          if (snapshot.error != null){
            return Center(child: Text(snapshot.error.toString(),style: TextStyle(color: Color(0xff021A2B)),));
          }
          return ListView.builder(
            itemCount: HomeAPI.listRecommendation.length,
            itemBuilder: (context,index) {
              // if (index.isOdd) return Divider(color: Colors.red);
              return FoodHomeContent(HomeAPI.listRecommendation[index],this.userInfo);
            },
          );
        } 
      )
    );
  }
}

class FoodHomeContent extends StatelessWidget {
  final Recipe recipeFromApi;
  final LoginInfo userInfo;

  FoodHomeContent(this.recipeFromApi,this.userInfo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(recipeFromApi.id.toString(),userInfo.idCust.toString()),
          ),
        );
      },
      child:Container(
        height: 125,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                  image: NetworkImage('https://www.etheral.id/assets/recipes/'+this.recipeFromApi.id.toString()+'.jpeg'),
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
                    child: Text(this.recipeFromApi.nama.trim().toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                  ),
                  Container(
                    // color: Colors.cyan,
                    width: MediaQuery.of(context).size.width-160,
                    height: 64, 
                    child: Text(this.recipeFromApi.desc.trim(), textAlign: TextAlign.left),
                  ),
                ],
              ),
            )
          ],
        ),
      ) ,
    );
    
    ;
  }
}