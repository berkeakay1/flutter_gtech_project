import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_gtech_project/models/model.dart';

class Service {
  static Future<List<Model>> fetchData() async {
    var res =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (res.statusCode == 200) {
      return [
      for (final item in jsonDecode(res.body)) 
      Model.fromJson(item),
    ];
    } else {
      throw Exception('Failed to load album');
    }
  }
}
