import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rebound_mtb/ui/rebound.dart';

void main() {
  runApp(
      new MaterialApp(
          title: 'Rebound',
          home: new Rebound()
      )

  );
  //Make the app full-screen
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
