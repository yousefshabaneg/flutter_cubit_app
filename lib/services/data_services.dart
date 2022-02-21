import 'dart:convert';

import 'package:flutter_cubit_appp/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((place) => DataModel.fromJson(place)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("DataServices error $e");
      return [];
    }
  }
}
