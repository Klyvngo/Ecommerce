import 'dart:developer';

import 'package:ecomerce/components/custom_suffix_icon.dart';
import 'package:ecomerce/components/default_button.dart';
import 'package:ecomerce/components/form_errors.dart';
import 'package:ecomerce/helper/keyboardutils.dart';
import 'package:ecomerce/models/profile.dart';
import 'package:ecomerce/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key, required this.email}) : super(key: key);
  final String? email;
  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _profile = {'name': '', 'address': '', 'phone': ''};
  List<String> errors = [];
  void _adderror({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void _removeerror({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await Provider.of<Profile>(context, listen: false).postProfile(
          widget.email!,
          _profile['name']!,
          _profile['address']!,
          _profile['phone']!);
      KeyBoardUtils.hideKeyboard(context);
      Navigator.of(context)
          .pushNamed(OtpScreen.routeName, arguments: _profile['phone']);
    } catch (error) {
      log('profile_form ${error.toString()}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              hintMaxLines: 1,
              suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onSaved: (value) => _profile['name'] = value!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _removeerror(error: kNamelNullError);
              }
              _profile['name'] = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                _adderror(error: kNamelNullError);
                return '';
              }
              return null;
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your address',
              hintMaxLines: 1,
              suffixIcon:
                  CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            keyboardType: TextInputType.streetAddress,
            onSaved: (value) => _profile['address'] = value!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _removeerror(error: kAddressNullError);
              }
              _profile['address'] = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                _adderror(error: kAddressNullError);
                return '';
              }
              return null;
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phonenumber',
              hintText: 'Enter your phone number',
              hintMaxLines: 1,
              suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
            ),
            onSaved: (value) => _profile['phone'] = value!,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                _adderror(error: kPhoneNumberNullError);
                return '';
              }
              return null;
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                _removeerror(error: kPhoneNumberNullError);
              }
              _profile['phone'] = value;
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormErrors(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButtons(
            text: 'Complete',
            press: _submit,
          ),
        ],
      ),
    );
  }
}
