import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginAPI {
  static login(username,password) async {
    var url = 'https://www.etheral.id/index.php/api/login';
    var response = await http.post(url, body: {'username': username, 'password': password});
    Map<String, dynamic> map = jsonDecode(response.body);
    print(map['success']); 
    print(map['data']['email']);
    if (map['success']){
      return LoginInfo(map['data']['username'], map['data']['email'], map['data']['id_customer'], true);
    } else {
      return LoginInfo(null, null, null, false);
    }
  }
}

class LoginInfo {
  bool success;
  var idCust;
  var email;
  var username;

  LoginInfo(this.username,this.email,this.idCust,this.success);
}

// main() async {
//   print('LOGIN...');
//   var x = await LoginAPI.login('udin123','123456');
//   print(x.success);
//   print('Login has been finished');
// }