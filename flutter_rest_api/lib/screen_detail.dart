import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/model.dart';

enum ProductMode { Editing, Adding }

class ScreenDetail extends StatefulWidget {
  final ProductMode productMode;
  final Product item;

  const ScreenDetail({Key key, this.item, this.productMode}) : super(key: key);
  @override
  _ScreenDetailState createState() => _ScreenDetailState();
}

class _ScreenDetailState extends State<ScreenDetail> {
  TextEditingController name = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.productMode == ProductMode.Adding
            ? Text("ADD PRODUCT")
            : Text("EDIT PRODUCT"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: widget.productMode == ProductMode.Adding
                    ? 'add name'
                    : this.widget.item.name,
              ),
            ),
            TextField(
              controller: subTitle,
              decoration: InputDecoration(
                hintText: widget.productMode == ProductMode.Adding
                    ? 'add subTitle'
                    : this.widget.item.subTitle,
              ),
            ),
            RaisedButton(
              onPressed: () {
                widget.productMode == ProductMode.Adding
                    ? addProduct(name.text, subTitle.text).then((value) {
                        print("success");
                      })
                    : updateProduct(
                            name.text, subTitle.text, this.widget.item.id)
                        .then((value) {
                        print("success");
                      });
              },
              child: Text("Lưu"),
            )
          ],
        ),
      ),
    );
  }
}
