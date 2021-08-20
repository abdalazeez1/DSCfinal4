import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child:Text('DSC Shop ',style: TextStyle(color: Colors.indigo,fontSize: 34,fontWeight: FontWeight.bold),) )),
      );

  }
}
