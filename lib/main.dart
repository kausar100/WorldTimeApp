import 'package:flutter/material.dart';
import 'package:flutterworldtime/pages/home.dart';
import 'package:flutterworldtime/pages/loading.dart';
import 'package:flutterworldtime/pages/location.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/loc': (context) => ChooseLocation(),
    }
));
