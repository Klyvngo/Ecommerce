import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile with ChangeNotifier {
  String? email;
  String? _name;
  String? _address;
  String? _phone;
  String get name {
    return _name!;
  }

  String get address {
    return _address!;
  }

  String get phone {
    return _phone!;
  }

  Future<void> postProfile(
      String email, String name, String address, String phone) async {
    const url =
        'https://ecommerce-e14a9-default-rtdb.asia-southeast1.firebasedatabase.app/listprofile.json';
    try {
      final reponse = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'name': name,
          'address': address,
          'phone': phone,
        }),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
