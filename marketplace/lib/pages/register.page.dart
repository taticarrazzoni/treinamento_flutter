import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:marketplace/utils/colors.util.dart';
import 'package:marketplace/utils/input.util.dart';
import 'package:marketplace/widgets/button_primary.widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _titleStyle = TextStyle(
    color: ColorUtil.font,
    fontSize: 34,
    fontStyle: FontStyle.italic,
  );

  final _countries = ['Brazil', 'United States of America', 'Other'];

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  final _userData = UserRegisterData();

  Widget buildSimpleInput(
      String label,
      TextInputType type,
      TextCapitalization capitalization,
      FormFieldValidator<String>? validation,
      ValueChanged<String>? onChanged,
      ) =>
      TextFormField(
          cursorColor: ColorUtil.cursor,
          style: InputUtil.inputContentStyle,
          textCapitalization: capitalization,
          keyboardType: type,
          validator: validation,
          decoration: InputUtil.getDecoration(label),
          onChanged: onChanged);

  Widget buildFullNameInput() => buildSimpleInput(
    'Full Name',
    TextInputType.text,
    TextCapitalization.words,
        (text) {
      if (text == null || text.length < 3) {
        return 'Invalid full name';
      }
    },
        (value) {
      _userData.fullName = value;
    },
  );

  Widget buildEmailAddressInput() => buildSimpleInput(
    'Email Address',
    TextInputType.emailAddress,
    TextCapitalization.none,
        (text) {
      if (text == null || text.length < 3) {
        return 'Invalid email address';
      }
    },
        (value) {
      _userData.emailAddress = value;
    },
  );

  Widget buildMobileNumberInput() => buildSimpleInput(
    'Mobile Number',
    TextInputType.phone,
    TextCapitalization.none,
        (text) {
      if (text == null || text.length < 3 || text.length > 15) {
        return 'Invalid mobile number';
      }
    },
        (value) {
      _userData.mobileNumber = value;
    },
  );

  Widget buildCountryInput() {
    List<DropdownMenuItem<String>> countries = _countries
        .map((country) =>
        DropdownMenuItem<String>(child: Text(country), value: country))
        .toList();

    return DropdownButtonFormField<String>(
      items: countries,
      decoration: InputDecoration(
        labelText: 'Country',
        labelStyle: InputUtil.labelStyle,
        floatingLabelStyle: InputUtil.floatingLabelStyle,
      ),
      isExpanded: true,
      icon: Icon(Icons.expand_more, color: ColorUtil.primary),
      value: null,
      style: InputUtil.inputContentStyle,
      validator: (value) {
        if (value == null) {
          return 'Select a value';
        }
      },
      onChanged: (value) {
        _userData.country = value;
      },
    );
  }

  Widget buildPasswordInput() => TextFormField(
    cursorColor: ColorUtil.cursor,
    style: InputUtil.inputContentStyle,
    keyboardType: TextInputType.text,
    validator: (text) {
      if (text == null || text.length < 8) {
        return 'Invalid password';
      }
    },
    onChanged: (value) {
      _userData.password = value;
    },
    obscureText: _isPasswordHidden,
    decoration: InputUtil.getDecoration(
      'Password',
      suffixIcon: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          setState(() {
            _isPasswordHidden = !_isPasswordHidden;
          });
        },
        child: Icon(
          _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
          color: ColorUtil.suffixIcon,
        ),
      ),
    ),
  );

  Widget buildConfirmPasswordInput() => TextFormField(
    cursorColor: ColorUtil.cursor,
    style: InputUtil.inputContentStyle,
    keyboardType: TextInputType.text,
    validator: (text) {
      if (text == null || text != _userData.password) {
        return 'Invalid password';
      }
    },
    obscureText: _isConfirmPasswordHidden,
    decoration: InputUtil.getDecoration(
      'Confirm Password',
      suffixIcon: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          setState(() {
            _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
          });
        },
        child: Icon(
          _isConfirmPasswordHidden
              ? Icons.visibility
              : Icons.visibility_off,
          color: ColorUtil.suffixIcon,
        ),
      ),
    ),
  );

  Widget buildReferalCodeInput() => buildSimpleInput(
    'Referral Code (Optional)',
    TextInputType.number,
    TextCapitalization.sentences,
    null,
        (value) {
      _userData.referalCode = value;
    },
  );

  Widget buildInputSpacer() => const SizedBox(height: 35);

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User data'),
          content: Text(_userData.toString()),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.background,
      appBar: AppBar(
        backgroundColor: ColorUtil.background,
        elevation: 0,
        leading: InkWell(
          customBorder: const CircleBorder(),
          child: Icon(
            Icons.arrow_back,
            color: ColorUtil.appBarIcon,
          ),
          onTap: () {
            dev.log(
              'App bar back arrow clicked',
              name: runtimeType.toString(),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: _titleStyle,
                ),
                const SizedBox(height: 50),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      buildFullNameInput(),
                      buildInputSpacer(),
                      buildEmailAddressInput(),
                      buildInputSpacer(),
                      buildMobileNumberInput(),
                      buildInputSpacer(),
                      buildCountryInput(),
                      buildInputSpacer(),
                      buildPasswordInput(),
                      buildInputSpacer(),
                      buildConfirmPasswordInput(),
                      buildInputSpacer(),
                      buildReferalCodeInput(),
                      buildInputSpacer(),
                      ButtonPrimaryWidget(
                        label: 'Register',
                        onTap: () {
                          if (_registerFormKey.currentState?.validate() ??
                              false) {
                            _showMyDialog();
                          } else {
                            dev.log(
                              'Values:\n----\n${_userData.toString()}',
                              name: runtimeType.toString(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserRegisterData {
  String? fullName;
  String? emailAddress;
  String? mobileNumber;
  String? country;
  String? password;
  String? referalCode;

  @override
  String toString() {
    return 'Full Name: $fullName'
        '\nEmail Address: $emailAddress'
        '\nMobile number: $mobileNumber'
        '\nContry: $country'
        '\nPassword: $password'
        '\nReferal Code: $referalCode';
  }
}
