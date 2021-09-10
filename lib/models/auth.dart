import 'dart:convert';
import 'dart:developer';

import 'package:ecomerce/components/http_catcherror.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTime;
  String get userId {
    return _userId!;
  }

  Future<String?> getUser() async {
    notifyListeners();
    return userId;
  }

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCLuTkTdWFg784cveVnrdtmqVtD_0OoNwU';
    try {
      final reponse = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );
      final reponseData = json.decode(reponse.body);
      if (reponseData['error'] != null) {
        throw HttpException(reponseData['error']['message']);
      }
      _token = reponseData['idToken'];
      _userId = reponseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(reponseData['expiresIn']),
        ),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    return authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    return authenticate(email, password, 'signUp');
  }
}
