import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
      )
    ); 
  }

   //@override
    initScreen(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
             colors: [
               Color(0xFF3383CD),
               Color(0xFF11249F),
             ])
         ),

         child: Stack(
           children: <Widget>[
             Align(
               alignment: Alignment.center,
               child: Image.asset("assets/img/logokecil.png"),
             ),
            Positioned(
              bottom:  270,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 1,
                    )
                  ],
            ),
              ))
           ],
           
         ),
       ),
      
    );
  }
}


