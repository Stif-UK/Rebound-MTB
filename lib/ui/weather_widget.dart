
import 'package:flutter/material.dart';
import 'package:rebound_mtb/util/utils.dart' as util;
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/network/network.dart';

class WeatherWidget extends StatefulWidget{
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<weather_forecast_model> forecastObject;
  String latitude = util.defaultLat;
  String longitude = util.defaultLon;

  @override
  void initState() {
    // TODO: Update initialisation of location
    super.initState();
    forecastObject = Network().getWeatherForecast(latitude, longitude);
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