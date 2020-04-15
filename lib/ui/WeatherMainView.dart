import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/utils.dart' as utils;

/*
The weatherMainView widget shows and styles the weather information for today
and will display prominently in the upper centre of the screen.
 */
Widget weatherMainView(AsyncSnapshot<weather_forecast_model> snapshot){
  var forecastList = snapshot.data.current;
  var formatDate = new DateTime.fromMillisecondsSinceEpoch(snapshot.data.current.dt * 1000);


  Container weatherMainView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //Display location
        Text("Lennox Forest"), //Todo: Update to dynamically provide location info
        //Display day and date
        Text("${utils.Utils.getFormattedDate(formatDate)}"),
        //Display current temperature
        Text("Current Temperature " + snapshot.data.current.temp.round().toString() + "°C"),
        //Display current weather
        Text(snapshot.data.current.weather[0].description),


        SizedBox(height: 10,), //SizedBox used to add space only
        Icon(Icons.wb_sunny, size: 180,)

      ],
    )
  );

  return weatherMainView;

}