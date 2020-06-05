import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';

import 'ForecastCard.dart';


Widget weatherBottomView(AsyncSnapshot<weatherForecastModel> snapshot,BuildContext context ){
  var dailyForecastList = snapshot.data.daily;
  if(dailyForecastList.length > 7) dailyForecastList.removeAt(0); //pop the first entry from the list as 'today' is already displayed

  return Column(
    //begin with a left alignment
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Divider(thickness: 2, color: Colors.black, endIndent: 40, indent: 40,),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("7 Day Forecast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800
        ),),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                //set width relative to size of screen
                width: MediaQuery.of(context).size.width / 3.5,
                height: 160,
                child: forecastCard(snapshot, index),

              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: dailyForecastList.length),
      )
    ],
  );

}