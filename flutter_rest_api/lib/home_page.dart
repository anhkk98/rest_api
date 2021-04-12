import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/screen_detail.dart';

import 'model/model.dart';

class HomePage extends StatefulWidget {
  Future<List<Product>> products;
  HomePage({Key key, this.products}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpTimedFetch();
  }
  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      setState(() {
        widget.products = fetchProducts();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenDetail(productMode: ProductMode.Adding,)));
        },
      ),
        appBar: AppBar(title: Text("Product Navigation")),
        body: Center(
          child: FutureBuilder<List<Product>>(
            future: widget.products, builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenDetail(item: snapshot.data[index],productMode: ProductMode.Editing,)));
                  },
                  child: ProductBox(item: snapshot.data[index],),
                );
              },
            ):

            // return the ListView widget :
            Center(child: CircularProgressIndicator());
          },
          ),
        )
    );
  }
}

class ProductBox extends StatefulWidget {
  ProductBox({Key key, this.item}) : super(key: key);
  final Product item;

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  Widget build(BuildContext context) {
    // print(this.widget.item.id);
    return Container(
        padding: EdgeInsets.all(2), height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.widget.item.name, style:TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.widget.item.subTitle),
                            RaisedButton(onPressed: () async{
                              await deleteProduct(this.widget.item.id);
                              print(this.widget.item.id);
                            },child: Text("delete"),),
                            RaisedButton(
                              onPressed: (){
                                
                              },
                              child: Icon(Icons.favorite),
                            )
                            // Text("Price: " + this.item.price.toString()),

                          ],
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}