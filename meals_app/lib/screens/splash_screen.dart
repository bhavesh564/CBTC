import 'package:flutter/material.dart';
import 'package:meals_app/screens/tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TabScreen(),
      ));
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color.fromARGB(255, 131, 57, 0),
      body: Center(
        child: Text(
          "TasteBud",
          style: TextStyle(color: Colors.white, fontSize: 72),
        ),
      ),
    );
  }
}
