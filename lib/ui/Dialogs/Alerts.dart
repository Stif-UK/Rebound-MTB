import 'package:flutter/material.dart';

class Alerts{

  static failedAPICallAlert(BuildContext context, String message){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Something's gone wrong!"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            content:


            Column(
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                ExpansionTile(title: Text("There's been an error contacting the server:"),
                children: <Widget>[
                  Text("The following error was returned:\n\n $message")
                ],),
                Text("\nPlease try again later. \n\nIf this issue persists please report to the developer."),
              ],
            ),

            actions: <Widget>[
              FlatButton(
                  child: Text("OK"),
                  onPressed: (){Navigator.of(context).pop();})
            ],
          );
        });


  }

}