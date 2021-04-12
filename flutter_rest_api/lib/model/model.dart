import 'dart:convert';
import 'package:flutter_rest_api/sever_api.dart';
import 'package:http/http.dart' as http;

List data;

class Product {
  final String id;
  final String name;
  final String subTitle;

  Product(this.id, this.name, this.subTitle);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['name'],
      json['subTitle'],
    );
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}
Future<List<Product>> fetchProducts() async {
  final response = await http.get('https://5fcdb345603c0c0016487c0c.mockapi.io/api/products');
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

// update data product
Future<Product> updateProduct(String name, String subTitle, String id) async{
  final jsonData = '{"name": "$name","subTitle":"$subTitle"}';
  final response = await http.put('$get_product/$id',body: jsonData,headers: {"Content-Type": "application/x-www-form-urlencoded"},);
  if(response.statusCode == 200){
    final res = await json.decode(response.body);
    return Product.fromMap(res);
  }else{
    throw Exception("error update");
  }
}

// add data product
Future<Product> addProduct(String name, String subTitle) async{
  final jsonData = '{"name": "$name","subTitle":"$subTitle"}';
  final response = await http.post(get_product,body:jsonData,
    headers: {"Content-Type": "application/x-www-form-urlencoded"},);
  if(response.statusCode == 200){
    final res = await json.decode(response.body);
    return Product.fromMap(res);
  }
}

// delete product
Future<Product> deleteProduct(String id) async{
  final response = await http.delete('$get_product/$id');
  if( response.statusCode == 200) {
    final res = await json.decode(response.body);
    return Product.fromMap(res);
  }else {
    throw Exception("xoa ko dc");
  }
}


