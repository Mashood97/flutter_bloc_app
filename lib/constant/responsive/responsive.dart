import 'package:flutter/material.dart';

double getResponsiveValue(BuildContext context, double baseValue) {
  final screenWidth = MediaQuery.of(context).size.width;

  // Define scaling factors for different screen widths
  // Adjust these values to suit your design preferences
  if (screenWidth < 600) {
    // Small screen size
    return baseValue * 0.8;
  } else if (screenWidth >= 600 && screenWidth < 1200) {
    // Medium screen size
    return baseValue;
  } else {
    // Large screen size
    return baseValue * 1.2;
  }
}
