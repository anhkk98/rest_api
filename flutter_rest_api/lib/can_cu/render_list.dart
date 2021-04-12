

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/can_cu_model.dart';

class RenderMenu extends StatefulWidget {
  final CanCuModel data;
  final bool checkChildBold;

  const RenderMenu(
      {Key key, this.data, this.checkChildBold})
      : super(key: key);
  @override
  _RenderMenuState createState() => _RenderMenuState();
}

class _RenderMenuState extends State<RenderMenu> {
  bool checkShow = false;

  @override
  void initState() {
    // TODO: implement initState
    // checkChildX();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          widget.checkChildBold ?? false ? Padding(
            padding:
            const EdgeInsets.only(bottom: 10, left: 35, right: 35),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  checkShow = !checkShow;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.orange[700]),
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 12, bottom: 12),
                child: Text(
                  widget.data.nameVung,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ) :Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  checkShow = !checkShow;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Stack(
                  children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Container(
                        width: 120,
                        color: Colors.lightGreen[900],
                      ),
                    ),
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightGreen[900],
                            Colors.lightGreen[900],
                            Colors.lightGreen[900],
                            Colors.lightGreen[900],
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.data.nameVung,
                                  style: TextStyle(
                                      fontFamily: 'UTMImpact',
                                      fontSize: 14,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          checkShow ?
          Column(
            children: widget.data.items.map((e) => RenderMenu(data: e,checkChildBold: true,)).toList(),
          ):Container()

        ]
    );
  }
}
