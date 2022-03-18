import 'dart:async';
import 'package:flutter/material.dart';

import 'LoginSignup_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginSignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return InitWidget();
  }

  Widget InitWidget() {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        Center(
          child: Column(
            children: [
              Image.asset(
                "images/r.png",
                height: 500.0,
                width: 400.0,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ]),
    );
  }
}
