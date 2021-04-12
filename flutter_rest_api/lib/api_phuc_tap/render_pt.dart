import 'package:flutter/material.dart';
import 'package:flutter_rest_api/api_phuc_tap/phuc_tap_nhat_model.dart';

class RenderPT extends StatefulWidget {
  final User user;

  const RenderPT({Key key, this.user}) : super(key: key);


  @override
  _RenderPTState createState() => _RenderPTState();
}

class _RenderPTState extends State<RenderPT> {

  bool checkData = false;
  bool checkImages = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              checkImages = !checkImages;
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,
            ),
            child: Text('${widget.user.firstName} ${widget.user.lastName}'),
          ),
        ),
        checkImages ? Column(
          children: widget.user.images.map((img) => Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Text(img.imageName),
          )).toList(),
        ):Container()
      ],
    );
  }
}
