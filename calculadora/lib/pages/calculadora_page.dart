import 'package:flutter/material.dart';

import '../utils/colors_util.dart';
import '../widgets/display.dart';
import '../widgets/keyboard.dart';
import '../utils/keyboard_util.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({Key? key}) : super(key: key);

  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _displayValue = '';

  _onKeyPressed(String key) {
    String displayValue = _displayValue;

    if (KeyboardUtils.isNumeric(key)) {
      displayValue += key;
    } else if (key == '+/-') {
      // TODO: do nothing
    } else if (key == '.' && !KeyboardUtils.hasSeparator(displayValue)) {
      displayValue += key;
    } else if (KeyboardUtils.isOperation(key)) {
      final lastKeyIndex = displayValue.length - 1;
      if (KeyboardUtils.isOperation(displayValue[lastKeyIndex])) {
        displayValue = displayValue.substring(0, lastKeyIndex) + key;
      } else {
        displayValue += key;
      }
    } else if (key == 'C') {
      displayValue = '';
    } else if (key == '=') {
      displayValue = _calculateResult();
    }
    setState(() {
      _displayValue = displayValue;
    });
  }

  String _calculateResult() {
    final operators = _displayValue
        .split(KeyboardUtils.operationRegex)
        .map((e) => double.tryParse(e) ?? 0)
        .toList();
    final operations = _displayValue
        .split(KeyboardUtils.operatorRegex)
        .where((e) => e.isNotEmpty)
        .toList();

    double result = 0;
    for (var i = 0; i < operators.length; i++) {
      if (i == 0) {
        result = operators[i];
      } else {
        switch (operations[i - 1]) {
          case '+':
            result += operators[i];
            break;
          case '-':
            result -= operators[i];
            break;
          case 'X':
            result *= operators[i];
            break;
          case '/':
            result /= operators[i];
            break;
          default:
            break;
        }
      }
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Display(value: _displayValue),
            ),
            Expanded(
              flex: 6,
              child: Keyboard(
                onKeyPressed: _onKeyPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
