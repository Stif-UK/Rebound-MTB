import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:rebound_mtb/Error_Handling/AppException.dart';

import 'package:rebound_mtb/model/StrapiNewsDemo.dart';

class StrapiNetwork{

  Future<StrapiNewsDemo> getNews() async {
    print("getNews() called");
    var finalUrl = "http://localhost:1337/news-posts/";
    print("URL set");

    try {
      print("try block entered");
      final response = await get(Uri.encodeFull(finalUrl),
          headers: {HttpHeaders.authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlZWUyNGE5NTliNWU2NGIyMjE5YjdhYSIsImlhdCI6MTU5Mjc0MzA3NSwiZXhwIjoxNTk1MzM1MDc1fQ.hwlLxgn8j57i7h0W-eHau4OXld5doi5TBt-rPhmTkPc"})
          .timeout(
          Duration(seconds: 30));

      switch(response.statusCode){

        case 200:
          print("Got a ${response.statusCode} back!\n"
              "${response.body}");
          final jsonResponse = json.decode(response.body);
          List<StrapiNewsDemo> news = [];

          for(var n in jsonResponse){
            StrapiNewsDemo article = StrapiNewsDemo.fromJson(jsonResponse[n]);
            news.add(article);
          }

          return StrapiNewsDemo.fromJson(jsonResponse[0]);

//          final jsonresponse = json.decode(response.body);
//          return Users.fromJson(jsonresponse);
//          return Users.fromJson(jsonresponse[0]);


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