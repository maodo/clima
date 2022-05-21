import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';

class NetworkingHelper {

  final String url;

  NetworkingHelper({required this.url});

  Future getData() async {
    Response response = await get(url);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}
