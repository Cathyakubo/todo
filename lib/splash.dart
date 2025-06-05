import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkFirstTime().then((isFirstTime) {
      Future.delayed(const Duration(seconds: 2), () {
        if (isFirstTime) {
          Navigator.of(context).pushReplacementNamed('/signup');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });
    });
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_box, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'TODO',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 32,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
