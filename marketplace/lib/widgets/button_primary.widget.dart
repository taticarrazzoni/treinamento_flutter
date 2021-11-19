import 'package:flutter/material.dart';
import 'package:marketplace/utils/colors.util.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String label;
  final Function onTap;

  const ButtonPrimaryWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        constraints: BoxConstraints(
          minHeight: 50,
          minWidth: MediaQuery.of(context).size.width,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorUtil.buttonBackground,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: ColorUtil.buttonFont,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
