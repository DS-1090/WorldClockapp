import 'package:flutter/material.dart';
import 'package:weather_app/loading.dart';
import 'Home.dart';
import 'location.dart';

void main() => runApp(MaterialApp(
  //home: Home(),
     initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location': (context) => Location(),
    }


));