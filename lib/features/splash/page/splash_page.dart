import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pushReplacementNamed(context, '/login'));
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Splash Logo"),
      )),
    );
  }
}