import 'package:flutter/material.dart';
import 'package:marketplace/utils/colors.util.dart';

class InputUtil {
  static TextStyle inputContentStyle = TextStyle(
    color: ColorUtil.inputContent,
    fontSize: 20,
  );

  static TextStyle labelStyle = TextStyle(
    color: ColorUtil.label,
    fontSize: 16,
  );

  static TextStyle floatingLabelStyle = TextStyle(
    color: ColorUtil.floatingLabel,
    fontSize: 16,
  );

  static getDecoration(String label, {Widget? suffixIcon}) => InputDecoration(
      labelText: label,
      labelStyle: labelStyle,
      floatingLabelStyle: floatingLabelStyle,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorUtil.primary,
          width: 2,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorUtil.input),
      ),
      suffixIcon: suffixIcon
  );
}
