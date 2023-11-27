import 'package:flutter/material.dart';

class Constants {
  static String apiKey = "AIzaSyAYU293toDU7d1WoahZ1hQUaT-25-mzuyk";
  static String appId = "1:335977392113:web:a3a12e9245b8cca6c1c650";
  static String messagingSenderId = "335977392113";
  static String projectId = "mychat-f4b77";
  final primaryColor = const Color(0xFFee7b64);
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
