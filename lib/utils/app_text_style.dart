import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

/// XXL = 28
/// Extra Large = 24
/// Large = 20
/// Medium = 16
/// Normal = 14
/// Small = 12
/// Button = 10

TextStyle textButton({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 10,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textSmall({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 12,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textNormal({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textMedium({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textLarge({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 20,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textExtraLarge({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textXXL({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 28,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
    decorationColor: neutral40,
  );
}

TextStyle textXXXL({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 75,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
    decorationColor: neutral40,
  );
}

TextStyle textFull({bool? isBold = false, required Color color, bool? isUnderline}) {
  return TextStyle(
    fontSize: 50,
    fontWeight: isBold == true ? FontWeight.bold : FontWeight.w500,
    color: color,
    decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none,
    decorationColor: neutral40,
  );
}

TextStyle textHintStyle() {
  return TextStyle(
    color: neutral70,
    fontSize: 13,
  );
}

TextStyle textFieldStyle() {
  return TextStyle(
    fontSize: 13,
    color: neutral80,
  );
}

TextStyle textErrorTextFieldStyle() {
  return TextStyle(
    backgroundColor: Colors.transparent,
    fontSize: 12.0,
    color: Color(0xffFF494A),
    fontWeight: FontWeight.w600,
  );
}
