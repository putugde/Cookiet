import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeAPI {
  static List listRecommendation;

  static getRecommendation(idUser,mood) async {
    listRecommendation = List();
    var url = 'https://www.etheral.id/index.php/api/fetch?mood='+mood.toString()+'&id_user='+idUser.toString();
    print(url);
    var response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    var data = map['data'];
    // print('INI DATANYA'+data);
    for (var obj in data){
      // Map<String, dynamic> map2 = jsonDecode(obj);
      listRecommendation.add(Recipe(obj['id_recipe'],obj['deskripsi'],obj['nama']));
    }
  }
}

class Recipe{
  int id;
  String desc;
  String nama;

  Recipe(this.id,this.desc, this.nama);

}