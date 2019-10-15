import 'dart:convert';
// import 'package:cookiet/pages/refrigerator.dart';
import 'package:http/http.dart' as http;

class IngredientData {
  int id;
  String nama;

  IngredientData(this.id,this.nama);

  IngredientData.fromJson(Map<String, dynamic> json)
      : id = json['id_ingredients'],
        nama = json['nama'];
}

class IngredientsList {
  static List list;

  static getList() async {
    list = List();
    var response = await http.get('https://www.etheral.id/index.php/api/getIngredients');
    Map<String, dynamic> map = jsonDecode(response.body);
    var data = map['data'];
    for (var obj in data) {
      list.add(IngredientData.fromJson(obj));
    }
  }
}

class Refrigerators{
  static List refrigeratorItemList;

  static getRefrigeratorDataItem(idUser) async {
    refrigeratorItemList = List();
    var response = await http.get('https://www.etheral.id/index.php/api/getKulkas?id_user='+idUser.toString());
    Map<String, dynamic> map = jsonDecode(response.body);
    for (var obj in map['data']){
      refrigeratorItemList.add(RefrigeratorItem(obj['id_ingredients'].toString(), obj['nama'].toString().toUpperCase(),obj['jumlah'].toString()));
    }
  }
}

class RefrigeratorItem{
  String idBahan;
  String jumlah;
  String nama;

  RefrigeratorItem(this.idBahan, this.nama, this.jumlah);
}