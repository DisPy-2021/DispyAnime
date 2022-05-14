import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);
  final String url;

  Future getData(String endpoint) async {
    http.Response response = await http.get(Uri.parse(url + endpoint));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('status: ${response.statusCode}');
    }
  }

  Future postData(String endpoint, var json) async {
    print(json);
    print(this.url + endpoint);
    final responseHttp = await http.post(Uri.parse(url + endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json);
    if (responseHttp.statusCode == 200) {
      return responseHttp;
    } else {
      print(responseHttp);
      return null;
    }
  }
}
