import 'package:flutter/material.dart';
import 'package:prayer_time_flutter/widgets/prayer_time_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrayerTimeList(),
    );
  }
}