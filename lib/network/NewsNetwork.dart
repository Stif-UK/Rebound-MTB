import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:rebound_mtb/Error_Handling/AppException.dart';
import 'package:rebound_mtb/model/StrapiNewsModel.dart';
import 'package:rebound_mtb/network/StrapiAuthNetwork.dart';

class NewsNetwork{

  String bearerToken = "";

  Future<List<StrapiNewsModel>> getNews() async {
    print("getNews() called");
    var finalUrl = "http://178.128.164.111/news-posts/?_sort=created_at:DESC";
    print("URL set");

    try {
      print("try block entered");

      //get a token
      Future<String> futureToken = StrapiAuthNetwork().getStrapiToken();
      bearerToken = await futureToken;

      final response = await get(Uri.encodeFull(finalUrl),
          headers: {HttpHeaders.authorizationHeader: "Bearer $bearerToken"})
          .timeout(
          Duration(seconds: 30));

      switch(response.statusCode){

        case 200:
          print("Got a ${response.statusCode} back!\n"
              "${response.body}");
          print("decoding the body...");
          final jsonResponse = json.decode(response.body);
          print("creating the list...");
          List<StrapiNewsModel> articles = [];

          print("iterating over the response...");

          for(var i in jsonResponse){
            articles.add(StrapiNewsModel.fromJson(i));
          }


          print("returning the articles...");
          return articles;
//



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
          throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");


      }

    } on SocketException  {
      print("Got a SocketException!");
      throw FetchDataException("No internet connection");
    }

  }


}