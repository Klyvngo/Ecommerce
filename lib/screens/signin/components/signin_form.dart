import 'package:ecomerce/components/custom_suffix_icon.dart';
import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/components/form_errors.dart';
import 'package:ecomerce/components/http_catcherror.dart';
import 'package:ecomerce/helper/keyboardutils.dart';
import 'package:ecomerce/models/auth.dart';
import 'package:ecomerce/screens/login_success/login_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool? remember = false;
  final _passwordController = TextEditingController();
  List<String> errors = [];
  void addError(String? error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError(String? error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(_authData['email']!, _authData['password']!);
      KeyBoardUtils.hideKeyboard(context);
      Navigator.of(context).pushNamed(LoginSuccess.routeName);
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
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
                _authData['email'] = value!;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(value)) {
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
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your Password',
                hintMaxLines: 1,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: 'assets/icons/Lock.svg',
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              obscureText: true,
              controller: _passwordController,
              onSaved: (value) {
                _authData['password'] = value!;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(kPassNullError);
                } else if (value.length >= 8) {
                  removeError(kShortPassError);
                }
                return;
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
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                const Text(
                  'Remember',
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            FormErrors(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DefaultButtons(
              text: 'Login',
              press: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
