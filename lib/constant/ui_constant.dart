import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppColors {
  final bmiColorSwatch = const ColorSwatch(0xFF388E3C, {
    "inputBorder": Color(0xFFC8E6C9),
    "disabledBorder": Color(0xFFBDBDBD),
    "filledBtnColor": Color(0xFF388E3C),
    "headingColor": Color(0xFF212121),
    "successColor": Color(0xFF8BC34A),
  });
}

class AllowDigitsOnly extends TextInputFormatter {
  static final RegExp _allowedCharacters = RegExp(r"\D");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text.replaceAll(_allowedCharacters, '');
    int selectionIndex = newValue.selection.baseOffset -
        newValue.text.length +
        filteredText.length;
    selectionIndex = selectionIndex.clamp(0, filteredText.length);

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
