import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
Openweathermap.com API key - note, this file is now
 */

final appId = "d0edca9fea9205fd09feb4e06514e3af";
/*
Default latitude and longitude for Lennox Forest
 */
final String defaultLat = "55.968999";
final String defaultLon = "-4.226788";
