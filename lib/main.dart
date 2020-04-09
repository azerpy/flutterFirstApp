import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m2_app/pages/DetailsPage.dart';
import 'package:m2_app/pages/MyHomePage.dart';
import 'package:m2_app/pages/catsPages.dart';
import 'package:m2_app/pages/responsive_page.dart';

void main() => runApp(DevicePreview(
    builder: (context) => MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessDevice = MediaQuery.of(context).platformBrightness;
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness:  Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.amberAccent
      ),
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (BuildContext context) => MyHomePage(),
        DetailsPage.routeName: (BuildContext context) => DetailsPage(),
      },
      home: ResponsivePage(),
    );
  }
}