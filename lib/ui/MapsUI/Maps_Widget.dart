import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rebound_mtb/Services/LocationServices.dart';
import 'package:rebound_mtb/model/ThreeWordsModel.dart';
import 'package:rebound_mtb/model/UserLocation.dart';
import 'package:rebound_mtb/network/what_three_words_network.dart';



class MapsWidget extends StatefulWidget{
  @override
  _MapsWidgetState createState() => _MapsWidgetState();

  }


class _MapsWidgetState extends State<MapsWidget>{
  String _locationText = "Location will show here";
  String _threeWordsText = "3 words show here";

  @override
  Widget build(BuildContext context) {
    //String _locationText = "Location will show here";

    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
          child: new Text("Click to get 3 Word Location"),
        ),
        Container(
          alignment: Alignment.center,
            child: new IconButton(icon: new Icon(MdiIcons.crosshairsGps,size: 50), onPressed: onLocationTap)
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(50),
          child: new Text(_locationText),

        ),
    Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(50),
    child: new Text(
        _threeWordsText,
      style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, ),
      textAlign: TextAlign.center,
    ),
    )
      ],
    );

  }


  void onLocationTap() async {
    print("button pressed");
    UserLocation location =  await LocationService.getLocation();
    ThreeWordsModel threeWords = await what_three_words_network().getThreeWords(location.latitude, location.longitude);
    String threeString = threeWords.words;

    setState(() {
      _locationText = location.toString();
      _threeWordsText = threeString;
    });
  }
}