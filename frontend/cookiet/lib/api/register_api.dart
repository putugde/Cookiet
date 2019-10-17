import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookiet/api/login_api.dart';

class RegisterAPI {  
  static register(String username, String email, String password) async {
    var url = 'https://www.etheral.id/index.php/api/createUser';
    var response = await http.post(url, body: {'username': username, 'email': email, 'password': password});
    Map<String, dynamic> map = jsonDecode(response.body);
    if (map['success']){
      return LoginInfo(map['data']['username'], map['data']['email'], map['data']['id'], true);
    }else {
      return LoginInfo(null, null, null, false);
    }
  }
}