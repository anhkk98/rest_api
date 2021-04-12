import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_rest_api/home_page.dart';
import 'package:flutter_rest_api/model/modeltesst.dart';
import 'package:flutter_rest_api/model/news/news.dart';
import 'package:flutter_rest_api/model/news/news_model.dart';
import 'dart:async';
import 'api_phuc_tap/phuc_tap_nhat_model.dart';
import 'api_phuc_tap/pt_page.dart';
import 'array.dart';
import 'can_cu/can_cu_page.dart';
import 'model/can_cu_model.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: Colors.greenAccent,
  bottomAppBarColor: Colors.greenAccent,
  hintColor: Colors.yellowAccent,
  textTheme: TextTheme(
    title: TextStyle(
      color: Colors.white,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  accentColor: Colors.blueAccent,
  hintColor: Colors.deepOrangeAccent,
  bottomAppBarColor: Colors.grey,
  textTheme: TextTheme(
    title: TextStyle(
      color: Colors.white,
    ),
  ),
);

void main(){
  runApp(MyApp());
  fetchPageX();
}

class MyApp extends StatelessWidget {
  // final Future<List<Book>> book;
  // MyApp({Key key,this.book}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedThemeApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
      home: PTPage()
    );
  }
}


class Teest extends StatefulWidget {

  @override
  _TeestState createState() => _TeestState();
}

class _TeestState extends State<Teest> {


  //
  // getNewsX() async{
  //   News newsX = News();
  //    await newsX.getNews();
  //    newModel = newsX.news;
  //    setState(() {
  //      _loading = false;
  //    });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<NewsModel>>(
            future: getNews(),
            builder: (context, snashot){
              if(snashot.hasError) print(snashot.error);
              return snashot.hasData ? NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      title: Text("data"),
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(snashot.data[0].title,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13.0,
                              ),textAlign: TextAlign.start),
                          background: Image.network(
                            snashot.data[0].image,
                            fit: BoxFit.cover,
                          )),

                    ),

                  ];
                },
                body: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)
                  ),
                  child: ListView.builder(
                    itemCount: snashot.data.length-1,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)
                          ),
                              padding: EdgeInsets.all(8),
                              child: Text(snashot.data[index+1].title),
                        ),
                      );
                    },
                  ),
                ),
              ): CircularProgressIndicator();
            },
          )
        ),
      ),
    );
  }
}