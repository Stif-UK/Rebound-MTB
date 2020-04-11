import 'package:flutter/material.dart';

class Rebound extends StatelessWidget{

  void openSettings(){
    //todo: implement showstuff
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("Rebound MTB"),
        centerTitle: false,
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.settings),
              onPressed: openSettings)

        ],
      ),
    );
  }

}