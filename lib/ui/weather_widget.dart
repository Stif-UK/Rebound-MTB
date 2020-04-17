
import 'package:flutter/material.dart';
import 'package:rebound_mtb/ui/WeatherBottomView.dart';
import 'package:rebound_mtb/util/utils.dart' as util;
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/network/network.dart';

import 'WeatherMainView.dart';

class WeatherWidget extends StatefulWidget{
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<weatherForecastModel> forecastObject;
  DateTime lastRefreshed = DateTime.now();
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
      return RefreshIndicator(
        onRefresh: _refreshWeather,
        child: ListView(
          children: <Widget>[
            //Display search box with customLocationSearchBox()
            //customLocationSearchBox(),
            Container(
              child: FutureBuilder<weatherForecastModel>(
                future: forecastObject,
                  builder: (BuildContext context, AsyncSnapshot<weatherForecastModel> snapshot){

                  if(snapshot.hasData){
                    return Column(
                      children: <Widget>[
                        //surface the main weather view widget
                        weatherMainView(snapshot),
                        //surface the bottom weather view widget
                        weatherBottomView(snapshot, context),
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
        ),
      );
    }

  Future<void> _refreshWeather() async {
    var difference = DateTime.now().difference(lastRefreshed).inMinutes;
    print("time since last refresh: " + difference.toString());
    //only refresh the API call if at least 10 minutes have passed
    if(difference > 10) {
      setState(() {
        forecastObject = Network().getWeatherForecast(latitude, longitude);
        lastRefreshed = DateTime.now();
      });
    }

    return forecastObject;
  }
}

  /*
  textFieldView returns a search input box widget.
  not currently used in implementation.
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


