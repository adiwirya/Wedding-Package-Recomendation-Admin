import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  String email;
  String password;
  String? name;
  String? role;

  User({
    required this.email,
    required this.password,
    this.name,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
      );
}

class Users with ChangeNotifier {
  
  Future<String> login(User user) async {
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/user/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"email": user.email, "password": user.password}),
      );
      // print(response.body);
      notifyListeners();
      final obj = json.decode(response.body);
      print(obj);
      return obj['message'];
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> register(User user) async {
    final url =
        Uri.https('skripsi-spk-saw.herokuapp.com', '/api/user/register');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"email": user.email, "password": user.password}),
      );
      // print(response.body);
      notifyListeners();
      final obj = json.decode(response.body);
      return obj['message'];
    } catch (error) {
      return error.toString();
    }
  }
}
