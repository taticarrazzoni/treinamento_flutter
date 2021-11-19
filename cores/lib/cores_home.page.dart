import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorsHomePage extends StatelessWidget {
  const ColorsHomePage({Key? key}) : super(key: key);

  Widget newElement(Color? color) {
    return Expanded(
      child: Container(
        color: color,
      ),
    );
  }

  Widget newColumn(int numberOfElements, int flex, MaterialColor color) {
    List<Widget> elements = [];
    for(int i = 1; i <= numberOfElements; i++) {
      var element = newElement(color[i*100]);
      elements.add(element);
    }

    return Expanded(
      flex: flex,
      child: Row(
        children: elements,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                newElement(Colors.purple[100]),
                newElement(Colors.purple[200]),
                newElement(Colors.purple[300]),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                newElement(Colors.red[100]),
                newElement(Colors.red[200]),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                newElement(Colors.green[100]),
                newElement(Colors.green[200]),
                newElement(Colors.green[300]),
                newElement(Colors.green[400]),
              ],
            ),
          ),
          newColumn(9, 1, Colors.blue)
        ],
      ),
    );
  }
}
