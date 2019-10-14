import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeData{
  int id;
  String desc;
  String nama;

  RecipeData(this.id, this.desc, this.nama);

  RecipeData.fromJson(Map<String, dynamic> json)
      : id = json['id_recipe'],
        desc = json['deskripsi'],
        nama = json['nama'];
}

class SearchResultAPI {
  static List list;

  static getList(String key) async {
    list = List();
    var response = await http.get('https://www.etheral.id/index.php/api/search?search='+key);
    Map<String, dynamic> map = jsonDecode(response.body);
    var data = map['data'];
    for (var obj in data) {
      list.add(RecipeData.fromJson(obj));
    }
  }
}