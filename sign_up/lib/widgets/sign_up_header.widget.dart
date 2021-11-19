import 'package:flutter/material.dart';
import 'package:sign_up/utils/colors.util.dart';
import 'dart:developer' as dev;

class SignUpHeader extends StatelessWidget {
  final TextStyle _titleStyle = TextStyle(
    color: ColorUtil.white,
    fontWeight: FontWeight.w700,
    fontSize: 23,
  );

  final TextStyle _smallTextStyle = TextStyle(
    color: ColorUtil.grey,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sign Up',
          style: _titleStyle,
        ),
        Spacer(),
        Text(
          'Already have an account?',
          style: _smallTextStyle,
        ),
        TextButton(
          onPressed: () {
            dev.log(
              'click into link "Log In"',
              name: runtimeType.toString(),
            );
          },
          child: Text(
            'Log In',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
