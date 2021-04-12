import 'package:flutter/material.dart';
import 'package:flutter_rest_api/api_phuc_tap/phuc_tap_nhat_model.dart';
import 'package:flutter_rest_api/api_phuc_tap/render_pt.dart';

class PTPage extends StatefulWidget {
  @override
  _PTPageState createState() => _PTPageState();
}

class _PTPageState extends State<PTPage> {
  bool checkData = false;
  bool checkImages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<PageX>(
            future: fetchPageX(),
            builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        checkData = !checkData;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Text(snapshot.data.author.firstName),
                    ),
                  ),
                  SizedBox(height: 10,),
                  checkData ? Column(
                    children: snapshot.data.data.map((data) => RenderPT(user: data,)).toList(),
                  ): Container()
                ],
              ): CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
