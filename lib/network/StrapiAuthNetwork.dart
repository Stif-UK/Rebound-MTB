import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:rebound_mtb/Error_Handling/AppException.dart';
import 'package:rebound_mtb/model/StrapiAuthModel.dart';
import 'package:rebound_mtb/util/api_keys.dart' as keys;

class StrapiAuthNetwork {
  //StrapiAuthNetwork provides a method to obtain a bearer token for the app, using
  //the generic app user set up in Strapi

  String password = keys.api_keys.getStrapiUser();

  Future<String> getStrapiToken() async {
    print("getStrapiToken() called");
    var finalUrl = "http://178.128.164.111/auth/local/";
    print("URL set");

    try {
      print("try block entered");

      final response = await post(
          Uri.encodeFull(finalUrl), body: {"identifier": "AppUser",
        "password": password})
          .timeout(
          Duration(seconds: 30));

      switch (response.statusCode) {
        case 200:
          print("Got a ${response.statusCode} back!\n"
              "${response.body}");
          print("decoding the body...");
          final jsonResponse = json.decode(response.body);
          return StrapiAuthModel.fromJson(jsonDecode(response.body)).jwt;



        case 401:
          print("Got a ${response.statusCode} back!");
          throw UnauthorisedException(response.body.toString());

        case 404:
          print("Got a ${response.statusCode} back!");
          throw NotFoundException(response.body.toString());

        case 429:
          print("Got a ${response.statusCode} back!");
          throw TooManyRequestsException(response.body.toString());

        default:
          print("Got a ${response.statusCode} back!");
          throw FetchDataException(
              "Error occurred while communicating with server with status code: ${response
                  .statusCode}");
      }
    } on SocketException {
      print("Got a SocketException!");
      throw FetchDataException("No internet connection");
    }
  }
}