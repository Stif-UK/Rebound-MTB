import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:rebound_mtb/Error_Handling/AppException.dart';
import 'package:rebound_mtb/model/CalendarEventModel.dart';
import 'package:rebound_mtb/network/StrapiAuthNetwork.dart';

class CalendarEventNetwork{

  String bearerToken = "";

  Future<Map<DateTime,List<dynamic>>> getEvents() async {
    print("getEvents() called");
    var finalUrl = "http://178.128.164.111/events/";
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
          List<CalendarEventModel> events = [];

          print("iterating over the response...");

          for(var i in jsonResponse){
            events.add(CalendarEventModel.fromJson(i));
            print("${CalendarEventModel.fromJson(i).title} added to list");
          }

          print("Events list populated with ${events.length} values");


          print("creating the map");
          Map<DateTime, List> eventMap = {};

          print("iterating over the Events List...");

          for(var i = 0; i < events.length; i++){
            print("creating the date");
            var createTime = DateTime(DateTime.parse(events[i].eventdate).year,
                DateTime.parse(events[i].eventdate).month, DateTime.parse(events[i].eventdate).day);
            print("Date created: $createTime");
            var original = eventMap[createTime];
            if (original == null) {
              print("null");
              eventMap[createTime] = [events[i]];
            } else {
              print(events[i]);
              eventMap[createTime] = List.from(original)
                ..addAll([events[i]]);
            }
          }


          print("returning the events Map...");
          print(eventMap.toString());
          return eventMap;
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