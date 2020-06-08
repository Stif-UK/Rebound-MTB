import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rebound_mtb/Copy/Accident_copy.dart';
import 'package:rebound_mtb/Services/LocationServices.dart';
import 'package:rebound_mtb/model/ThreeWordsModel.dart';
import 'package:rebound_mtb/model/UserLocation.dart';
import 'package:rebound_mtb/network/what_three_words_network.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';



class AccidentWidget extends StatefulWidget{
  @override
  _AccidentWidgetState createState() => _AccidentWidgetState();

  }


class _AccidentWidgetState extends State<AccidentWidget>{
  String _locationText = "Click for location";
  TextStyle _locationStyle = locationStyleBefore;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {


    return ListView(
      padding: EdgeInsets.fromLTRB(5,15, 5, 15),
      children: <Widget>[
        SizedBox(height: 30,),
        Text("Had an accident on the trails?", style: weatherHeader, textAlign: TextAlign.center,),
        Padding(
          padding: const EdgeInsets.fromLTRB(8,15, 8, 10),
          child: Text(AccidentCopy().introCopy),
        ),
        ExpansionTile(title: Text("Stay Calm"),leading: Icon(Icons.ac_unit),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AccidentCopy().calmCopy),
            ),

          ],),
        ExpansionTile(title: Text("Know where you are"),leading: Icon(Icons.not_listed_location,),
          children: <Widget>[
            Text(AccidentCopy().locationCopy,
            textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: <Widget>[
                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: _isLoading? Center(child: CircularProgressIndicator(),):

                    IconButton(
                        icon: Icon(Icons.my_location, size: 35,), onPressed: onLocationTap),
                  ),

                  Text(_locationText, style: _locationStyle,)
                ],
              ),
            ),
          ],),
        ExpansionTile(title: Text("Contact Emergency Services"),leading: Icon(Icons.phone_in_talk),
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(icon: Icon(Icons.phone_forwarded), onPressed: _launchCaller),
                Text("Click to call (UK only)\n")
              ],
            )

          ],),
        ExpansionTile(title: Text("Administer basic first aid"),leading: Icon(Icons.local_hospital),
          children: <Widget>[
            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AccidentCopy().firstAidCopy,
                  textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    color: Theme.of(context).canvasColor,

                    //color: Colors.white,
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Image.asset('images/google_BRC.webp',
                          width: 100,
                          )
                        ],
                      ),
                      onPressed: _launchBRCapp),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Note: Rebound has no official associated with the British Red Cross.",
                  textAlign: TextAlign.center,),
                )

              ],
            )

          ],),
        ExpansionTile(title: Text("Disclaimer"), leading: Icon(Icons.info_outline),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AccidentCopy().disclaimerCopy, textAlign: TextAlign.center,),
          )

        ],)



      ],
    );

  }


  void onLocationTap() async {
    print("button pressed");
    setState(() {
      _isLoading = true;
      
    });

    UserLocation location =  await LocationService.getLocation();
    ThreeWordsModel threeWords = await what_three_words_network().getThreeWords(location.latitude, location.longitude);
    String threeString = threeWords.words;
    //Adding a small artificial delay to avoid the loading indicator looking janky!
    Timer(Duration(seconds: 3),(){
      setState(() {
        _isLoading = false;
        _locationText = threeString;
        _locationStyle = locationStyleAfter;
      });
    }
    );

  }
}

 void _launchCaller() async {
  const url = "tel: 999";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchBRCapp() {
  LaunchReview.launch(writeReview: false, androidAppId: "com.cube.rca",
      iOSAppId: "483408666");
  print("BRC button pressed");
}



//Styles to refactor out
final weatherHeader = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 25
) ;

final locationStyleBefore = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 15
) ;

final locationStyleAfter = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 25
) ;

