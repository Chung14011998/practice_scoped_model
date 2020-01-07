import 'package:design_ui_simple/service_locator.dart';
import 'package:design_ui_simple/ui/list_view.dart';
import 'package:flutter/material.dart';


void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Fetch Data",
      home: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: Text("Fetch Data"),
          ),
          body: new Container(
            child: BuildListView(),
          )),
    );
  }
}

