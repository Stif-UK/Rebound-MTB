import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/convert_icon.dart';
import 'package:rebound_mtb/util/utils.dart';

Widget forecastCard(AsyncSnapshot<weatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data.daily;
  var dayOfWeek = "";
  var date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Utils.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek,
        style: bottomViewStyle1 ,),
      )),
      Center(child: Container(
        padding: EdgeInsets.all(5),
        child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main, size: 40.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
            )
          ]
        ),

      )
      ),
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(forecastList[index].temp.max.round().toString() + "°C",
        style: bottomViewStyle1,),
      ))



        ],
      );



}

//Styles: Todo: Separate into styles class
final bottomViewStyle1 = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20
) ;