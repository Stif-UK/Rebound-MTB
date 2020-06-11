import 'dart:io';

import 'package:http/http.dart';
import 'package:rebound_mtb/Error_Handling/AppException.dart';
import 'package:rebound_mtb/model/ThreeWordsModel.dart';
import 'package:rebound_mtb/util/api_keys.dart' as keys;
import 'dart:convert';

class WhatThreeWordsNetwork {
  Future<ThreeWordsModel> getThreeWords(double lat, double long) async {
    var finalUrl = "https://api.what3words.com/v3/convert-to-3wa?coordinates="+lat.toString()+","+long.toString()+"&key="+keys.api_keys.getThreeWordsKey();

    try {
      final response = await get(Uri.encodeFull(finalUrl)).timeout(
        const Duration(seconds: 30));

      switch(response.statusCode){
        case 200:
          return ThreeWordsModel.fromJson(json.decode(response.body));

        case 400:
          throw BadRequestException(response.body.toString());

        case 401:
          throw UnauthorisedException(response.body.toString());

        default:
          throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");

      }

    } on SocketException  {
      throw FetchDataException("No internet connection");
    }

  }
}