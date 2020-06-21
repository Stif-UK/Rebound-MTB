import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/StrapiNewsDemo.dart';

Widget NewsWidgetContent(AsyncSnapshot<StrapiNewsDemo> snapshot){
  var theNews = snapshot.data.headline;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text("Today's headline: $theNews"),
    ],
  );
}

