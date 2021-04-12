import 'dart:convert';

import 'package:http/http.dart' as http;

class PageX{
  int page;
  int perPage;
  int total;
  int totalPage;
  Author author;
  List<User> data;

  PageX({this.page, this.perPage, this.total,this.totalPage, this. author, this.data});

  factory PageX.fromJson(Map<String, dynamic> json){
    var list = json['data'] as List;

    List<User> data = list.map((e) => User.fromJson(e)).toList();

    return PageX(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPage: json['total_pages'],
      author: Author.fromJson(json['author']),
      data: data,
    );
  }

}

class Author {
  String firstName;
  String lastName;

  Author({this.firstName, this.lastName});

  factory Author.fromJson(Map<String, dynamic> json){
    return Author(
      firstName: json['first_name'],
      lastName: json['last_name']
    );
  }
}

class User{
  int id;
  String firstName;
  String lastName;
  String avatar;
  List<Images> images;

  User({this.id, this.firstName, this.lastName, this.avatar, this.images});

  factory User.fromJson(Map<String, dynamic> json){

    var list = json['images'] as List;
    // print(list.runtimeType);
    List<Images> images = list.map((i) => Images.fromJson(i)).toList();

    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      images: images,
    );
  }
}

class Images{
  int id;
  String imageName;

  Images({this.id,this.imageName});

  factory Images.fromJson(Map<String, dynamic> json){
    return Images(
      id: json['id'],
      imageName: json['imageName']
    );
  }
}

List<User> parseUser(String responseBody) {
  final parsed = json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<User>> fetchUser() async {
  var url = 'https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/master/assets/page.json';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(parseUser(response.body)[1].firstName);
    return parseUser(response.body);
  } else {
    throw Exception('error load hdsd');
  }
}

Future<PageX> fetchPageX() async {
  var url = 'https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/master/assets/page.json';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PageX.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('error load hdsd');
  }
}