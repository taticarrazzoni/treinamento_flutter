import 'package:flutter/material.dart';

import 'keybord_key.dart';
import '../utils/keyboard_util.dart';

class Keyboard extends StatelessWidget {
  final Function(String keyValue) onKeyPressed;

  const Keyboard({
    Key? key,
    required this.onKeyPressed,
  }) : super(key: key);

  List<Widget> get _keyboardKeys => KeyboardUtils.keyboardMap
      .map(
        (String value) => KeyboardKey(
      label: value,
      value: value,
      onTap: onKeyPressed,
    ),
  )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _keyboardKeys,
    );
  }
}
