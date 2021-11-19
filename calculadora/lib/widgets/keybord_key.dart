import 'package:flutter/material.dart';

import '../utils/colors_util.dart';
import '../utils/keyboard_util.dart';

class KeyboardKey extends StatelessWidget {
  final String label;
  final String value;
  final Function(String value) onTap;

  const KeyboardKey({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  Color get _color => KeyboardUtils.isNumeric(value) || value == '.'
      ? ColorsUtils.darkGray
      : !KeyboardUtils.isOperation(value) && value != '=' || value == '+/-'
      ? ColorsUtils.lightGray
      : ColorsUtils.orange;

  Color get _textColor => KeyboardUtils.isNumeric(value) || value == '.'
      ? ColorsUtils.white
      : !KeyboardUtils.isOperation(value) && value != '=' || value == '+/-'
      ? ColorsUtils.black
      : ColorsUtils.white;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * .25;

    final width = label == '0' ? height * 2 : height;

    return Container(
      width: width,
      height: height,
      child: InkWell(
        onTap: () => onTap(value),
        child: Container(
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: _textColor, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
