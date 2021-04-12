import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/list_in_list.dart';

class ArrayObjectX extends StatefulWidget {
  @override
  _ArrayObjectXState createState() => _ArrayObjectXState();
}

class _ArrayObjectXState extends State<ArrayObjectX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<ProductImg>(
          future: loadProduct(),
          builder: (context, snapshot){
            return snapshot.hasData ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data.id.toString()),
                Text(snapshot.data.name),
                Column(
                  children: snapshot.data.images.map((e) => Text(e.imageName)).toList(),
                ),
              ],
            ):CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
