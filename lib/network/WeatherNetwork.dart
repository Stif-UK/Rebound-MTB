import 'dart:convert';
import 'dart:io';

import 'package:rebound_mtb/Error_Handling/AppException.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/api_keys.dart' as keys;
import 'package:http/http.dart';

class WeatherNetwork{
  Future<weatherForecastModel> getWeatherForecast(String lat, String lon) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&appid="+keys.api_keys.getWeatherKey()+"&units=metric";

    try {
      final response = await get(Uri.encodeFull(finalUrl)).timeout(
        Duration(seconds: 30));

      switch(response.statusCode){

        case 200:
          return weatherForecastModel.fromJson(json.decode(response.body));

        case 401:
          throw UnauthorisedException(response.body.toString());

        case 404:
          throw NotFoundException(response.body.toString());

        case 429:
          throw TooManyRequestsException(response.body.toString());

        default:
          throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");


      }
//
//      if(response.statusCode == 200){
//        print(weatherForecastModel.fromJson(json.decode(response.body)));
//        return weatherForecastModel.fromJson(json.decode(response.body));
//
//      }else{
//        throw Exception("Error getting weather forecast" + response.statusCode.toString());
//      }
    } on SocketException  {
      throw FetchDataException("No internet connection");
    }

  }
}

