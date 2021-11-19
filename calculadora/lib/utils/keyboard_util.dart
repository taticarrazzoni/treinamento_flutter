const _keyMap = [
  'C',
  '+/-',
  '%',
  '/',
  '7',
  '8',
  '9',
  'X',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '.',
  '=',
];

class KeyboardUtils {
  static List<String> get keyboardMap => _keyMap;
  static RegExp operationRegex = RegExp(r'[+\-X/]');
  static RegExp operatorRegex = RegExp(r'[0-9]*\.?[0-9]*');

  static bool isNumeric(String key) {
    final rx = RegExp(r'[0-9]');

    return rx.hasMatch(key);
  }

  static bool isOperation(String key) {
    return operationRegex.hasMatch(key);
  }

  static bool hasSeparator(String equation) {
    final rx = RegExp(r'\.\d*$');

    return rx.hasMatch(equation);
  }
}
