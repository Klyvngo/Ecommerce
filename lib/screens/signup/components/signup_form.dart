import 'dart:developer';

import 'package:ecomerce/components/custom_suffix_icon.dart';
import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/components/form_errors.dart';
import 'package:ecomerce/components/http_catcherror.dart';
import 'package:ecomerce/helper/keyboardutils.dart';
import 'package:ecomerce/models/auth.dart';
import 'package:ecomerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _dataCreate = {
    'email': '',
    'password': '',
  };
  String? confirmPassword;
  List<String> errorsT = [];
  void addError(String? error) {
    if (!errorsT.contains(error)) {
      setState(() {
        errorsT.add(error!);
      });
    }
  }

  void removeError(String? error) {
    if (errorsT.contains(error)) {
      setState(() {
        errorsT.remove(error!);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      log(_dataCreate.toString());
      await Provider.of<Auth>(context, listen: false)
          .signUp(_dataCreate['email']!, _dataCreate['password']!);
      KeyBoardUtils.hideKeyboard(context);
      Navigator.of(context)
          .pushNamed(ProfileScreen.routeName, arguments: _dataCreate['email']);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication fails!';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage =
            'There is no user record corresponding to this identifier.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage =
            'The password is invalid or the user does not have a password.';
      } else if (error.toString().contains('USER_DISABLED')) {
        errorMessage =
            'The user account has been disabled by an administrator.';
      }
      _showError(errorMessage);
    } catch (error) {
      const errorMessage = 'Cound not Authenticate you';
      _showError(errorMessage);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Error Login',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailTextField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          buildPasswordConfirmFormField(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          FormErrors(errors: errorsT),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          DefaultButtons(
            text: 'Continue',
            press: _submit,
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        hintMaxLines: 1,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        _dataCreate['email'] = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kEmailNullError);
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(kInvalidEmailError);
          return '';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        hintMaxLines: 1,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      onSaved: (value) {
        _dataCreate['password'] = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        }
        if (value.length >= 8) {
          removeError(kShortPassError);
        }
        if (_dataCreate['password'] == confirmPassword) {
          removeError(kMatchPassError);
        }
        _dataCreate['password'] = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);
          return '';
        } else if (value.length < 8) {
          addError(kShortPassError);
          return '';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordConfirmFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password Confirm',
        hintText: 'Password confirm',
        hintMaxLines: 1,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      onSaved: (value) {
        confirmPassword = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        }
        confirmPassword = value;
        if (_dataCreate['password'] == confirmPassword) {
          removeError(kMatchPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);
          return '';
        } else if (_dataCreate['password'] != confirmPassword) {
          addError(kMatchPassError);
          return '';
        }
        return null;
      },
    );
  }
}
