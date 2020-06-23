import 'package:flutter/material.dart';
import 'package:rebound_mtb/model/StrapiNewsDemo.dart';

Widget NewsWidgetContent(AsyncSnapshot<StrapiNewsDemo> snapshot){
  var headline = snapshot.data.headline;
  var content = snapshot.data.body;

  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    cacheExtent: 1000.0,
    children: <Widget>[
      Text("Headline: $headline"),
      Text("Content: $content"),
    ],

    );
}

