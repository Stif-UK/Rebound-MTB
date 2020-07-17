
import 'package:flutter/material.dart';
import 'package:rebound_mtb/ui/WeatherUI/WeatherBottomView.dart';
import 'package:rebound_mtb/util/utils.dart' as util;
import 'package:rebound_mtb/model/weather_forecast_model.dart';
import 'package:rebound_mtb/network/WeatherNetwork.dart';
import 'package:rebound_mtb/ui/Dialogs/Alerts.dart' as alerts;
import 'package:shared_preferences/shared_preferences.dart';

import 'WeatherMainView.dart';

class WeatherWidget extends StatefulWidget{
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<weatherForecastModel> forecastObject;
  DateTime lastRefreshed = DateTime.now();
  String location = "";
  String latitude = util.Utils.getLat("Lennox Forest");
  String longitude = util.Utils.getLon("Lennox Forest");
  bool locationChanged;

  //Get location from shared preferences
  Future<String> _getLocationFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final location = prefs.getString('location');
    if(location == null){
      return "Lennox Forest";
    }
    return location;
  }

  //Initialise the location
  Future<String> _initialiseLocation() async {
    location = await _getLocationFromSharedPref();

  }


  //Create callback to allow main view to pass back changes to location
  callback(String loc) async {

    final prefs = await SharedPreferences.getInstance();


    setState(() {
      locationChanged = (location != loc);
      location = loc;
      latitude = util.Utils.getLat(loc);
      longitude = util.Utils.getLon(loc);
      prefs.setString('location', loc);
      _refreshWeather();
      print("Location saved to shared prefs as ${prefs.getString('location')}");
      //TODO: Save last used location to shared preferences
    });
  }


  @override
  void initState() {
    // TODO: Update initialisation of location
    super.initState();
    forecastObject = WeatherNetwork().getWeatherForecast(latitude, longitude);
    _initialiseLocation();

//    forecastObject.then((weather) {
//      print(weather.current.temp);
//    });
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
                builder: (BuildContext context,
                    AsyncSnapshot<weatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        //surface the main weather view widget
                        weatherMainView(snapshot, callback, location, context),
                        //surface the bottom weather view widget
                        weatherBottomView(snapshot, context),
                      ],
                    );
                  } else {
                    forecastObject.then((value) => (print("Got the forecast!")),
                        onError: (error) {
                          alerts.Alerts.failedAPICallAlert(
                              context, error.toString());
                        }
                    );
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
    var difference = DateTime
        .now()
        .difference(lastRefreshed)
        .inMinutes;
    print("time since last refresh: " + difference.toString());
    //only refresh the API call if at least 10 minutes have passed or location has changed
    if (difference > 10 || locationChanged) {
      setState(() {
        forecastObject = WeatherNetwork().getWeatherForecast(latitude, longitude);
        forecastObject.then((value) => (print("Got the forecast on refresh for $location")),
            onError: (error){
              alerts.Alerts.failedAPICallAlert(context, error.toString());
            }
        );

        lastRefreshed = DateTime.now();
        locationChanged = false;
      });


      return forecastObject;
    }
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


