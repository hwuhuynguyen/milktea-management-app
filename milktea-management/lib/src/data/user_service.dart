import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ltdidong2/src/config/https/http_service.dart';
import 'package:ltdidong2/src/data/user.dart';

class UserService {
  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  factory UserService() {
    return _instance;
  }
  User? user;
  Future<bool> login(String email, String password) async {
    try {
      final Response response = await HttpService().request(
          url: "auth/login",
          method: Method.POST,
          params: {'email': email, 'password': password});
      user = User.fromJson(response.data["user"]);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
