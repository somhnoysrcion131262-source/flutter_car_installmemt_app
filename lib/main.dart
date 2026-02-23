
import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(
    flutter_speed_ui_app(),
  );
}

class flutter_speed_ui_app extends StatefulWidget {
  const flutter_speed_ui_app({super.key});

  @override
  State<flutter_speed_ui_app> createState() => _flutter_speed_ui_appState();
}

class _flutter_speed_ui_appState extends State<flutter_speed_ui_app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
    );
  }
}