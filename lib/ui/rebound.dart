import 'package:flutter/material.dart';
import 'package:rebound_mtb/ui/MapsUI/Maps_Widget.dart';
import 'package:rebound_mtb/ui/WeatherUI/weather_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Rebound extends StatefulWidget{

  @override
  _ReboundState createState() => _ReboundState();
}

class _ReboundState extends State<Rebound> {
  int _currentIndex = 0;
  final List<Widget> _children =[
    WeatherWidget(),
    MapsWidget(),
  ];

  void openSettings() async{
    //todo: implement openSettings

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: new AppBar(
//        title: Text("Rebound MTB"),
//        centerTitle: false,
//        backgroundColor: Colors.orangeAccent,
//        actions: <Widget>[
//          new IconButton(
//              icon: Icon(Icons.settings),
//              onPressed: openSettings)
//
//        ],
//      ),
      //body: new WeatherWidget(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
        BottomNavigationBarItem(
          icon: new Icon(MdiIcons.weatherSunny),
          title: new Text("Weather"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.priority_high),
          title: new Text("Crash!"),
        )
      ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}