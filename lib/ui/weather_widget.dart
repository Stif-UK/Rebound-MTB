
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
          //Display search box with customLocationSearchBox()
          //customLocationSearchBox(),
          Container(
            child: FutureBuilder<weather_forecast_model>(
              future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<weather_forecast_model> snapshot){

                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      //surface the main weather view widget
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

  /*
  textFieldView returns a search input box widget.
  I've setup an input search box as the header,
  however for implementation this needs to be swapped out for UI to
  allow selection between the forest or bikepark
  */
  Widget customLocationSearchBox() {
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


