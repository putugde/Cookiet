import 'package:cookiet/api/details_api.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String idRecipe;
  final String idUser;

  Details(this.idRecipe,this.idUser);

  @override
  _DetailsState createState() => _DetailsState(this.idRecipe, this.idUser);
}

class _DetailsState extends State<Details> {
  final String idRecipe;
  final String idUser;

  _DetailsState(this.idRecipe, this.idUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: GetRecipeDetails.getRecipeDetail(this.idRecipe, this.idUser),
        builder: (context,snapshot){
          return Scaffold(
            appBar: AppBar(
              backgroundColor:  Color(0xff021A2B),   //diganti
              title: Text(GetRecipeDetails.data.nama,style: TextStyle(color: Colors.white,)),
              elevation: 1.0,
            ),
            body: Content(),
            bottomNavigationBar: Container(
              color: Color(0xff021A2B),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 70,
              child: BottomAppBar(
                color: Color(0xff021A2B),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text('Progress : '+GetRecipeDetails.data.percent.toStringAsFixed(1)+'%',style: TextStyle(color: Color(0xffFFF7D6),fontSize: 20),), 
                    ),
                    Container(
                      width: 182,
                      child:RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color(0xff00C6B5),
                        child: Text('Cook It !', style: TextStyle(fontSize: 22),),
                        onPressed: () {},
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final step = GetRecipeDetails.data.step;
  final igd = GetRecipeDetails.data.ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                // color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://www.etheral.id/assets/recipes/'+GetRecipeDetails.data.id+'.jpeg')
                  )
                ),
              ),
              Container(
                alignment: Alignment(0,0),
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Color(0xff021A2B),
                child: Text('INGREDIENT',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xffFFF7D6),
                child: ColumnBuilder(
                  itemCount: this.igd.length,
                  itemBuilder: (context, index){
                    if (igd[index].available) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              height: 50,
                              width: MediaQuery.of(context).size.width - 80,
                              padding: EdgeInsets.all(5),
                              child: Text((index+1).toString().toUpperCase()+'.'+igd[index].namaBahan.trim(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.done,size: 30,),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text((index+1).toString().toUpperCase()+'.'+igd[index].namaBahan.trim(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 34,
                              child: RaisedButton(
                                shape: CircleBorder(),
                                onPressed: () {},
                                child: Icon(Icons.add,size: 30,),
                                padding: EdgeInsets.all(0),
                                color: Color(0xff00C6B5),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    
                  },
                ),                
              ),
              Container(
                alignment: Alignment(0,0),
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Color(0xff021A2B),
                child: Text('STEPS',style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xff00C6B5),    
                child: ColumnBuilder(
                  itemCount: step.length,
                  itemBuilder: (context,index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(step[index].trim(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                    );
                  },
                ),
              ),
            ],
          );
        },
      )
    );
  }
}


class ColumnBuilder extends StatelessWidget {
	final IndexedWidgetBuilder itemBuilder;
	final MainAxisAlignment mainAxisAlignment;
	final MainAxisSize mainAxisSize;
	final CrossAxisAlignment crossAxisAlignment;
	final TextDirection textDirection;
	final VerticalDirection verticalDirection;
	final int itemCount;

	const ColumnBuilder({
		Key key,
		@required this.itemBuilder,
		@required this.itemCount,
		this.mainAxisAlignment: MainAxisAlignment.start,
		this.mainAxisSize: MainAxisSize.max,
		this.crossAxisAlignment: CrossAxisAlignment.center,
		this.textDirection,
		this.verticalDirection: VerticalDirection.down,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Column(
			children: new List.generate(this.itemCount,
					(index) => this.itemBuilder(context, index)).toList(),
		);
	}
}