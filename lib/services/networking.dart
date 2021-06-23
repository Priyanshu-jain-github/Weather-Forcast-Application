import 'dart:convert';
import 'package:http/http.dart' as http;


class Networking{
  Networking(this.url);
  final String url;
  Future GetData() async{
    http.Response response = await http.get( url, );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeddata = jsonDecode(data);
      return decodeddata;
    } else {
      print(response.statusCode);
    }
  }
}