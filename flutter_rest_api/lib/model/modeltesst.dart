// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Book{
//   String id;
//   String name;
//   String title;
//   int price;
//   bool state;
//   Book(this.id,this.name,this.title,this.price,this.state);
//
//   factory Book.fromJson(Map<String,dynamic> json){
//     return Book(
//       json['id'],
//       json['name'],
//       json['title'],
//       json['price'],
//       json['state']
//     );
//   }
// }
//
// List<Book> pasedBook(String resBody) {
//   final pased = json.decode(resBody).cast<Map<String,dynamic>>();
//   return pased.map<Book>((json) => Book.fromJson(json)).toList();
// }
//
// Future<List<Book>> getBook()async{
//   final res = await http.get("https://5fcdb345603c0c0016487c0c.mockapi.io/api/book");
//   if(res.statusCode == 200){
//     return pasedBook(res.body);
//   }else{
//     throw Exception("error data");
//   }
// }
//
//
// Future<Book> deleteBook(String id) async{
//   final res = await http.delete("https://5fcdb345603c0c0016487c0c.mockapi.io/api/book/$id");
//   if(res.statusCode == 200) {
//     final response = json.decode(res.body);
//     return Book.fromJson(response);
//   }
// }