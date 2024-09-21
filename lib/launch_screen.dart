import 'package:flutter/material.dart';
import 'package:hour/stopwatch_screen.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the main screen.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StopwatchScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.tealAccent,
              Colors.deepPurpleAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Hour',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.7),
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
