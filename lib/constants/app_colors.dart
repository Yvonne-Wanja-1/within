import 'package:flutter/material.dart';

class AppColors {
  // Main colors
  static const primary = Colors.blueAccent; // Main blue
  static const secondary = Color(0xFF64B5F6); // Lighter blue
  static const accent = Color(0xFF82B1FF); // Very light blue

  // Light variations
  static const primaryLight = Color(0xFFE3F2FD); // Light blue
  static const secondaryLight = Color(0xFFBBDEFB); // Very light blue
  static const accentLight = Color(0xFFF5F9FF); // Almost white blue

  // Text colors
  static const textDark = Color(0xFF2D3436); // Almost black
  static const textGray = Color(0xFF636E72); // Medium gray

  // Gradients
  static const mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blueAccent, // Main blue
      Color(0xFF448AFF), // Deeper blue accent
    ],
  );

  static const cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blueAccent, // Main blue
      Color(0xFF2979FF), // Darker blue accent
    ],
  );
}
