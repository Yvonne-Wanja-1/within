import 'package:flutter/material.dart';

class AppColors {
  // Main colors
  static const primary = Color(0xFF6C5CE7); // Deep purple
  static const secondary = Color(0xFFa8e6cf); // Mint green
  static const accent = Color(0xFFfdcb6e); // Warm yellow

  // Light variations
  static const primaryLight = Color(0xFFE7E4F9); // Light purple
  static const secondaryLight = Color(0xFFE8F7F2); // Light mint
  static const accentLight = Color(0xFFFFF3E0); // Light yellow

  // Text colors
  static const textDark = Color(0xFF2D3436); // Almost black
  static const textGray = Color(0xFF636E72); // Medium gray

  // Gradients
  static const mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6C5CE7), // Deep purple
      Color(0xFF8E7CF3), // Lighter purple
    ],
  );

  static const cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFa8e6cf), // Mint
      Color(0xFF6C5CE7), // Deep purple
    ],
  );
}
