import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
Openweathermap.com API key
 */

final appId = "d0edca9fea9205fd09feb4e06514e3af";
final defaultCity = "Glasgow";


Future<Map> getWeather(String appId, String city) async {
  String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=metric';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);

}