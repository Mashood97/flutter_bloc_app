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

  final expenseAppColorSwatch = const ColorSwatch(0xFF3F51B5, {
    "inputBorder": Color(0xFF303F9F),
    "disabledBorder": Color(0xFFBDBDBD),
    "btnColor": Color(0xFFFF5252),
    "headingColor": Color(0xFF212121),
    "subHeadingColor": Color(0xFF757575),
    "successColor": Color(0xFFC5CAE9),
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
