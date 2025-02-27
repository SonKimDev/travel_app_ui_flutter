import 'package:flutter/material.dart';
import 'package:travel_app_ui_flutter/src/screens/travel_onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelOnboardingScreen(),
    );
  }
}
