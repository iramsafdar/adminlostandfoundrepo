import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lost_and_found/ui/screens/BottomNavScreen.dart';
import 'package:adminpanellostandfound/ui/screens/loginscreen.dart';
// import 'package:adminpanellostandfound/ui/screens/homepagescreen.dart';

import 'dashboardscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  void initState() {
    super.initState();
    final auth  = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()
          ),
        );
      });

    }
    else
    {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()
          ),
        );
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Color(0xFFD6E2F3),
        color: Color(0xFFEFF5FB),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOST",
                style: TextStyle(
                  color: Color(0xFF0D2C54), // Dark blue from logo
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "&",
                style: TextStyle(
                  color: Color(0xFFE99A25), // Orange from logo
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "FOUND",
                style: TextStyle(
                  color: Color(0xFF0D2C54), // Dark blue from logo
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}