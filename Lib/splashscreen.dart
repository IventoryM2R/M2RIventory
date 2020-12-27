import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';



class Splashscreen extends StatefulWidget {

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<Splashscreen> {

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 0);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),

      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: Colors.blue,
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.inventory,
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 24.0,),

            Text ("M2R",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),

            Text("IVENTORY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),)
          ],
        ),
      ),
    );

  }
}
