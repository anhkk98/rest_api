import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsModel {
  String articleUrl;
  String title;
  String description;
  String tag;
  String dateTime;
  int timestamp;
  String image;
  String sourceName;
  String sourceUrl;
  String sourceDomain;

  NewsModel({this.articleUrl,this.title,this.description,this.tag,this.dateTime,this.timestamp,this.image,this.sourceName,this.sourceUrl,this.sourceDomain});
  factory NewsModel.fromMap(Map<String, dynamic> json) {
    return NewsModel(
      articleUrl: json['article_url'],
      title: json['title'],
      description: json['description'],
      tag: json['description_with_tag'],
      dateTime: json['published_datetime'],
      timestamp: json['published_timestamp'],
      image: json['image_url'],
      sourceName: json['source_name'],
      sourceUrl: json['source_url'],
      sourceDomain: json['source_domain'],
    );
  }
}

List<NewsModel> pasedRes(String resBody){
  final pased = json.decode(resBody)['articles'].cast<Map<String,dynamic>>();
  return pased.map<NewsModel>((json) => NewsModel.fromMap(json)).toList();
}

Future<List<NewsModel>> getNews() async{
  String url = "https://gnewsapi.net/api/search?q=covid-19&language=vi&country=vn&api_token=X3SEfrkE6AYTWLrZfj9lD0Q0QeiagdhcLeYPO6xSM49CrF84Ekki3ZVCEhfK";
  final response = await http.get(url);
  final jsonData = pasedRes(response.body);
  if(response.statusCode == 200){
    return pasedRes(response.body);
  }
}