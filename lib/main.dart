import 'package:flutter/material.dart;
import 'package:apk_storage/
splashscreen_view.dart;

void main() => runApp(MyApp());
class MyApp extends StatelessWigdet {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
  false,
      title: 'Splash Screen',
      home: Splashscreen(),
     );
  }
}
