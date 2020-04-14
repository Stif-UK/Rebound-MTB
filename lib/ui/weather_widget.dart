
import 'package:flutter/material.dart';
import 'package:rebound_mtb/util/utils.dart' as util;
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/network/network.dart';

import 'WeatherMainView.dart';

class WeatherWidget extends StatefulWidget{
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<weather_forecast_model> forecastObject;
  String latitude = util.Utils.getLat();
  String longitude = util.Utils.getLon();

  @override
  void initState() {
    // TODO: Update initialisation of location
    super.initState();
    forecastObject = Network().getWeatherForecast(latitude, longitude);

    forecastObject.then((weather) {
      print(weather.current.temp);
    });
  }

    @override
    Widget build(BuildContext context) {
      return ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<weather_forecast_model>(
              future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<weather_forecast_model> snapshot){

                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      weatherMainView(snapshot)
                    ],
                  );

                }else{
                  return Container(
                    child: Center(child: CircularProgressIndicator(),)
                  );
                }

      },
          )
          )
        ],
      );
    }
  }

  /*I've setup an input search box as the header,
  however for implementation this needs to be swapped out for UI to
  allow selection between the forest or bikepark
  */
  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "EnterCityName",
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




//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      alignment: Alignment.center,
//      child: new Text("Testing"),
//    );
//  }

