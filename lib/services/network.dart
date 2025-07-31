import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper (this.url);


  Future getData ()async {

    
  Uri uri = Uri.parse(url);
 http.Response response = await  http.get(uri);
  if (response.statusCode == 200){
String data = response.body;

var decodedata = jsonDecode(data);
return decodedata;
  }else {
print(response.statusCode);
  }
  
}
}