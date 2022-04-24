import "package:flutter/material.dart";
import "package:rsa_algorithm/src/screens/view/splash.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
      body: SplashScreen(),
    );
}
