
import 'package:flutter/material.dart';
import 'package:rebound_mtb/util/weatherUtils.dart' as weatherUtils;

class WeatherWidget extends StatefulWidget{
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {

  void updateWeather() async {
    Map data = await weatherUtils.getWeather(weatherUtils.appId, weatherUtils.defaultCity);
    print(data.toString());

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: new Text("Testing"),
    );
  }

}