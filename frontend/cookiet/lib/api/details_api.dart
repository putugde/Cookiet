import 'package:http/http.dart' as http;
import 'dart:convert';


class GetRecipeDetails {
  static RecipeDetails data;

  static getRecipeDetail(idResep, idUser) async {
    var response = await http.get('https://www.etheral.id/index.php/api/resepDetail?id_recipe='+idResep+'&id_user='+idUser);
    Map<String, dynamic> map = jsonDecode(response.body);
    var listStep = map['data'][0]['data_recipe']['step'].toString().split('||');
    for (var oj in listStep){
      oj = oj.trim();
    }
    var listBahan = List();
    for (var obj in map['data'][0]['ingredients']){
      listBahan.add(Ingredients(obj['id_ingredients'].toString(), obj['nama'],obj['avail']));
    }
    data = RecipeDetails(map['data'][0]['data_recipe']['id_recipe'].toString(), map['data'][0]['data_recipe']['deskripsi'], map['data'][0]['data_recipe']['nama'].toString().toUpperCase(), listStep, listBahan, double.parse(map['data'][0]['percent'].toString())*100);
    // print(data.id);
    // print(data.desc);
    // print(data.nama);
    // print(data.step);
    // print(data.ingredients);
  }

}


class RecipeDetails {
  String id;
  String desc;
  String nama;
  List step;
  List ingredients;
  double percent;

  RecipeDetails(this.id, this.desc, this.nama, this.step, this.ingredients, this.percent);
}


class Ingredients {
  String namaBahan;
  bool available;
  String idBahan;

  Ingredients(this.idBahan, this.namaBahan, this.available);
}

// void main () async {
//   GetRecipeDetails.getRecipeDetail('1', '1');
// }