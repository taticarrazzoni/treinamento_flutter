import 'package:flutter/material.dart';
import 'package:sign_up/utils/colors.util.dart';

class CheckboxWithCustomLabelWidget extends StatelessWidget {
  final List<Widget> label;
  final bool value;
  final Function onChanged;

  const CheckboxWithCustomLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          Checkbox(
            checkColor: ColorUtil.white,
            activeColor: ColorUtil.green,
            side: BorderSide(
              color: ColorUtil.greyDark,
              width: 1,
            ),
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue);
            },
          ),
          ...label
        ],
      ),
    );
  }
}
