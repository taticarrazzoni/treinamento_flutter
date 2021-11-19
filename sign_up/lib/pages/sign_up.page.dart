import 'package:flutter/material.dart';
import "package:sign_up/utils/colors.util.dart";
import 'package:sign_up/widgets/button.widget.dart';
import 'package:sign_up/widgets/checkbox.widget.dart';
import 'package:sign_up/widgets/sign_up_header.widget.dart';
import 'dart:developer' as dev;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = false;
  bool _agreeToTermsAndPrivacyPolicy = false;
  bool _subscribeToProductUpdates = false;

  final _labelTextStyle = TextStyle(
    color: ColorUtil.grey,
    fontSize: 13,
  );

  final _requiredTextStyle = TextStyle(
    color: ColorUtil.red,
    fontSize: 13,
  );

  final _helperTextStyle = TextStyle(
    color: ColorUtil.greyDark,
    fontSize: 13,
  );

  final _borderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorUtil.greyDark, width: 1),
  );

  final _focusedBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: ColorUtil.white),
  );

  Widget buildRequiredLabel(String label) => Row(
    children: [
      Text(
        label,
        style: _labelTextStyle,
      ),
      SizedBox(width: 2),
      Text(
        '*',
        style: _requiredTextStyle,
      ),
    ],
  );

  List<Widget> buildFirstNameInput() => [
    Text(
      'First Name',
      style: _labelTextStyle,
    ),
    SizedBox(height: 10),
    TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      style: TextStyle(color: ColorUtil.white),
      decoration: InputDecoration(
        focusedBorder: _focusedBorderStyle,
        border: _borderStyle,
      ),
    ),
  ];

  List<Widget> buildEmailInput() => [
    buildRequiredLabel('Email'),
    SizedBox(height: 10),
    TextFormField(
      validator: (text) {
        if (text == null || text.length < 3) {
          return 'Invalid email';
        }
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: ColorUtil.white),
      decoration: InputDecoration(
        focusedBorder: _focusedBorderStyle,
        border: _borderStyle,
      ),
    ),
  ];

  List<Widget> buildPasswordInput() => [
    buildRequiredLabel('Password'),
    SizedBox(height: 10),
    TextFormField(
      validator: (text) {
        if (text == null || text.length < 8) {
          return 'Invalid password';
        }
      },
      obscureText: !_isPasswordHidden,
      style: TextStyle(color: ColorUtil.white),
      decoration: InputDecoration(
        suffixIcon: InkWell(
          // semelhante ao GestureDetector
          onTap: () {
            dev.log(
              'click into button show/hide password',
              name: runtimeType.toString(),
            );
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
          child: Icon(
            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
        focusedBorder: _focusedBorderStyle,
        border: _borderStyle,
      ),
    ),
    SizedBox(height: 10),
    Text(
      'Use 8 or more characters with a mix of letters, numbers, and symbols.',
      style: _helperTextStyle,
    ),
  ];

  Widget buildTextButton(String label, VoidCallback onPressed) => TextButton(
    onPressed: onPressed,
    child: Text(
      label,
      style: TextStyle(decoration: TextDecoration.underline),
    ),
  );

  Widget buildTermsCheckbox() => CheckboxWithCustomLabelWidget(
    label: [
      Text(
        'I agree to the',
        style: _labelTextStyle,
      ),
      buildTextButton(
        'Terms',
            () {
          dev.log(
            'click into link "Terms"',
            name: runtimeType.toString(),
          );
        },
      ),
      Text(
        'and',
        style: _labelTextStyle,
      ),
      buildTextButton(
        'Privacy Policy.',
            () {
          dev.log(
            'click no link "Privacy Policy"',
            name: runtimeType.toString(),
          );
        },
      ),
      Text(
        ' *',
        style: _requiredTextStyle,
      ),
    ],
    value: _agreeToTermsAndPrivacyPolicy,
    onChanged: (bool value) {
      setState(() {
        _agreeToTermsAndPrivacyPolicy = value;
      });
    },
  );

  Widget buildSubscribeCheckbox() => CheckboxWithCustomLabelWidget(
    label: [
      Text(
        'Subscribe for select product updates.',
        style: _labelTextStyle,
      )
    ],
    value: _subscribeToProductUpdates,
    onChanged: (bool value) {
      setState(() {
        _subscribeToProductUpdates = value;
      });
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SignUpHeader(),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...buildFirstNameInput(),
                      SizedBox(height: 20),
                      ...buildEmailInput(),
                      SizedBox(height: 20),
                      ...buildPasswordInput(),
                      SizedBox(height: 40),
                      buildTermsCheckbox(),
                      buildSubscribeCheckbox(),
                      SizedBox(height: 40),
                      ButtonWidget(
                        label: 'Sign Up',
                        onTap: () {
                          _formKey.currentState?.validate();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
