import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/*
This helper will take a weather condition as an input and return an icon
for the weather.
 */

Widget getWeatherIcon({String weatherDescription, double size}){

  switch(weatherDescription){
    case "Clear":
      { return Icon(MdiIcons.weatherSunny, size: size,);}
      break;

    case "Thunderstorm":
      { return Icon(MdiIcons.weatherLightning, size: size,);}
      break;

    case "Drizzle":
      { return Icon(MdiIcons.weatherRainy, size: size,);}
      break;

    case "Rain":
      { return Icon(MdiIcons.weatherPouring, size: size,);}
      break;

    case "Snow":
      { return Icon(MdiIcons.weatherSnowyHeavy, size: size,);}
      break;

    case "Clouds":
      { return Icon(MdiIcons.weatherCloudy, size: size,);}
      break;

    case "Mist":
      { return Icon(MdiIcons.weatherFog, size: size,);}
      break;

    case "Fog":
      { return Icon(MdiIcons.weatherFog, size: size,);}
      break;

    default:
      { return Icon(MdiIcons.cloudQuestion, size: size,);}
      break;

  }
}