import 'dart:async';
import '../screens/homescreen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(
     builder:(context)=>HomeScreen(),
    )));
  }
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq=MediaQuery.of(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.withOpacity(0.9),
                Colors.blue,
                ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget>[ Center(
            child: CircleAvatar(
              radius: mq.size.width/2-10,
              backgroundColor: Colors.redAccent,
              child: Text(
                "Body\nMass\nIndex",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontFamily: "Exo",
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          ),
          Text(
            "Calculator",
            style: TextStyle(
              fontFamily: "Exo",
              fontSize: 55,
            ),
          ),
        ]
        ),
      ),
    );
  }
}