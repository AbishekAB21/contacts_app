import 'package:contacts_app/screens/bottom-nav-bar.dart';
import 'package:contacts_app/utils/app-color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: appcolor.backgroundColor),
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}

Future<void> goHome(BuildContext context) async {
  await Future.delayed(Duration(seconds: 2));
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavBar(),
      ));
}
