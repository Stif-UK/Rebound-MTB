import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/utils.dart' as utils;

Widget weatherMainView(AsyncSnapshot<weather_forecast_model> snapshot){
  var forecastList = snapshot.data.current;
  var formatDate = new DateTime.fromMillisecondsSinceEpoch(snapshot.data.current.dt * 1000);


  Container weatherMainView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Lennox Forest"), //Todo: Update to dynamically provide location info
        Text("${utils.Utils.getFormattedDate(formatDate)}"),
        Text("Current Temperature " + snapshot.data.current.temp.round().toString() + "°C"),


        SizedBox(height: 10,), //SizedBox used to add space only
        Icon(Icons.wb_sunny, size: 200,)

      ],
    )
  );

  return weatherMainView;

}