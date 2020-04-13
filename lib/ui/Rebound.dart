import 'package:flutter/material.dart';
import 'package:rebound_mtb/ui/weatherWidget.dart';
import 'package:rebound_mtb/util/weatherUtils.dart' as weatherUtils;

class Rebound extends StatelessWidget{

  void openSettings() async{
    //todo: implement openSettings properly - currently used to test weather data fetch
    Map data = await weatherUtils.getWeather(weatherUtils.appId, weatherUtils.defaultCity);
    print(data.toString());

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