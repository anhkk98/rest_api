import 'dart:convert';

import 'package:http/http.dart' as http;

class CanCuModel {
  final String idVung;
  final String idVungParent;
  final String nameVung;
  final List<CanCuModel> items;

  CanCuModel({this.idVung,this.idVungParent,this.nameVung,this.items});

  factory CanCuModel.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['items'] as List;
    // print(list.runtimeType);
    List<CanCuModel> items = list.map((i) => CanCuModel.fromJson(i)).toList();


    return CanCuModel(
        idVung: parsedJson['id_vung'],
        idVungParent: parsedJson['id_vung_parent'],
        nameVung: parsedJson['name_vung'],
        items: items

    );
  }
}

List<CanCuModel> parseCanCu(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<CanCuModel>((json) => CanCuModel.fromJson(json)).toList();
}


Future<List<CanCuModel>> loadCanCu() async {
  var response = await http.get('http://api.truyenthong.thanhdoanhcm.com.vn/?c=vung-cu&m=list');
  // final jsonResponse = json.decode(response.body);
  // List<CanCuModel> items = jsonResponse.map<List<CanCuModel>>((i) => CanCuModel.fromJson(i)).toList();
  // print(items[1].nameVung);
  if (response.statusCode == 200) {
    print(parseCanCu(response.body)[1].nameVung);
    return parseCanCu(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}