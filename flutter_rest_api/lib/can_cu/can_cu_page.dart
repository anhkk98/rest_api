import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/can_cu_model.dart';
import 'package:flutter_rest_api/model/list_in_list.dart';
import 'file:///F:/Flutter/flutter_rest_api/lib/can_cu/render_list.dart';

class CanCuPage extends StatefulWidget {

  @override
  _CanCuPageState createState() => _CanCuPageState();
}

class _CanCuPageState extends State<CanCuPage> {

  Future<List<CanCuModel>> getData;
  bool checkShow = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData = loadCanCu();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<CanCuModel>>(
            future: getData,
            builder: (context, snapshot){
              return snapshot.hasData ?ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return  RenderMenu(data: snapshot.data[index],);
                },
              ):CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
