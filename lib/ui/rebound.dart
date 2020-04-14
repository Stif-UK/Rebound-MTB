import 'package:flutter/material.dart';
import 'package:rebound_mtb/ui/weather_widget.dart';
import 'package:rebound_mtb/util/weatherUtils.dart' as weatherUtils;

class Rebound extends StatelessWidget{

  void openSettings() async{
    //todo: implement openSettings

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
      body: new WeatherWidget(),
    );
  }

}