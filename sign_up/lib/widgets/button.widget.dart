import 'package:flutter/material.dart';
import 'package:sign_up/utils/colors.util.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorUtil.green,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorUtil.white,
          ),
        ),
      ),
    );
  }
}
