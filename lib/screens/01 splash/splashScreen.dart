import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(height: 100.h,width: 100.w,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash/splash.png"),fit: BoxFit.fill)),),
      ),
    );
  }
}
