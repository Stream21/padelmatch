import 'package:flutter/material.dart';
import 'login_screen_neumorphic.dart';

void main() {
  runApp(const CommunityPadelApp());
}

class CommunityPadelApp extends StatefulWidget {
  const CommunityPadelApp({super.key});

  @override
  State<CommunityPadelApp> createState() => _CommunityPadelAppState();
}

class _CommunityPadelAppState extends State<CommunityPadelApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PadelMatch',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginScreenNeumorphic(onToggleTheme: toggleTheme),
    );
  }
}
