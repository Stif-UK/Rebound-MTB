import 'dart:convert';

import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/utils.dart' as util;
import 'package:http/http.dart';
import 'dart:convert';

class Network{
  Future<weatherForecastModel> getWeatherForecast(String lat, String lon) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&appid="+util.Utils.getAppID()+"&units=metric";

    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}"+" - called");

    if(response.statusCode == 200){
      print(weatherForecastModel.fromJson(json.decode(response.body)));
      return weatherForecastModel.fromJson(json.decode(response.body));

    }else{
      throw Exception("Error getting weather forecast");
    }
  }
}

