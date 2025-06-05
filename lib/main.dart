import 'package:flutter/material.dart';
import 'package:three_screen_app/splash.dart';
import 'screens/folder/folder_page.dart';
import 'screens/login/login.dart';
import 'screens/login/signup/sign_up.dart';
import 'screens/personal/widget/personal_page.dart';
import 'screens/settings/widget/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/': (context) => const FolderPage(),
        '/second': (context) => PersonalPage(),
        '/third': (context) => const SettingsPage(),
      },
    );
  }
}
