import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/util/convert_icon.dart';
import 'package:rebound_mtb/util/utils.dart' as utils;

/*
The weatherMainView widget shows and styles the weather information for today
and will display prominently in the upper centre of the screen.
 */
Widget weatherMainView(
    AsyncSnapshot<weatherForecastModel> snapshot,
    Function(String) callback,
    String location){
  var forecastList = snapshot.data.current;
  var formatDate = new DateTime.fromMillisecondsSinceEpoch(snapshot.data.current.dt * 1000);
  String currentWeather = forecastList.weather[0].main;
  String currentLocation = location;


  Container weatherMainView = Container(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 25,), //SizedBox used to add space only
        //Display location
        Container(
          margin: EdgeInsets.all(25),
          child:
              ExpansionTile(
                title: Text(currentLocation, textAlign: TextAlign.left, style: weatherHeader,),
                leading: Icon(Icons.not_listed_location, size: 30,),

              children: <Widget>[

                FlatButton(onPressed: (){
                  callback("Falkland Bike Park");
                },
                    child: Text("Falkland Bike Park")),
                FlatButton(onPressed: (){
                  callback("Lennox Forest");
                },
                    child: Text("Lennox Forest")),
//                FlatButton.icon(onPressed: null, icon: Icon(Icons.my_location), label: Text("Find me")),
//                customLocationSearchBox(),
              ],)
//

        ), //Todo: Update to dynamically provide location info

        //Display day and date
        Text("${utils.Utils.getFormattedDate(formatDate)}",
        style: weatherDate,),


        SizedBox(height: 10,), //SizedBox used to add space only
        //insert the weather icon
        Container(
          padding: new EdgeInsets.all(10.0),
          margin: EdgeInsets.all(20.0),
          child: getWeatherIcon(weatherDescription: currentWeather, size: 150),
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
        ),



        //Display current temperature
        Text(forecastList.temp.round().toString() + "°C",
        style: weatherTemp,),

        //Display current weather description
        Text(forecastList.weather[0].description,
          style: weatherHeader,),



      ],
    )
  );



  return weatherMainView;



}



//Styles - todo: move to separate styles file
final weatherHeader = new TextStyle(
color: Colors.black,
fontWeight: FontWeight.w500,
fontSize: 25
) ;

final weatherTemp = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 40
) ;

final weatherDate = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20
) ;

Widget customLocationSearchBox() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8)
      ),
      onSubmitted: (value){

      },
    ),
  );
}

