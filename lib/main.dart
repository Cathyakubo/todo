import 'package:flutter/material.dart';

import 'screens/folder/folder_page.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FolderPage(),
        '/second': (context) => PersonalPage(),
        '/third': (context) => const SettingsPage(),
      },
    );
  }
}
