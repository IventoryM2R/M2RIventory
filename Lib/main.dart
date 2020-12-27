import 'package:flutter/material.dart';
import 'package:m2r_iventory/splashsreen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: Splashscreen(),
     );
  }
}
