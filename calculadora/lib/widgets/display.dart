import 'package:flutter/material.dart';

import '../utils/colors_util.dart';

class Display extends StatelessWidget {
  final String value;

  const Display({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: ColorsUtils.white,
              fontSize: 42,
            ),
          ),
        ],
      ),
    );
  }
}
