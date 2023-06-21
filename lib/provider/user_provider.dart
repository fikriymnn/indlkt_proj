import 'package:flutter/material.dart';
import 'package:indlkt_proj/methods/auth_methods.dart';
import 'package:indlkt_proj/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user;
  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
