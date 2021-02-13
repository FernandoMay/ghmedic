import 'package:flutter/material.dart';
import 'package:ghmedic/splash.dart';
import 'package:ghmedic/theme.dart';
import 'package:ghmedic/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghmedic',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
