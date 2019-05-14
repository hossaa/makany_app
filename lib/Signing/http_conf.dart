import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'class_items.dart';

class SendToData {
  // List<UserLogin> _users = [];
  // List<UserLogin> get alluser {
  //   return List.from(_users);
  // }

  // Future<bool> authentication(String username, String email, double phone,
  //     String password, String citys) async {
  //   final Map<String, dynamic> userData = {
  //     'username': username,
  //     'email': email,
  //     'phone': phone,
  //     'password': password,
  //     'citys': citys
  //   };
  //   final http.Response response = await http.post(
  //       'https://login-pro-53885.firebaseio.com/makany.json',
  //       body: json.encode(userData));
  //   if (response.statusCode != 200 && response.statusCode != 201) {
  //     return false;
  //   }
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //   final UserLogin newUser = UserLogin(
  //     id: responseData['name'],
  //     username: username,
  //     email: email,
  //     phone: phone,
  //     password: password,
  //     citys: citys,
  //     _users.add(newUser)
  //   );
  // }

  static const _url = 'https://login-pro-53885.firebaseio.com/makany.json';
  static final _headers = {'Content-Type': 'application/json'};

  Future<UserLogin> authentication(UserLogin userLogin) async {
    try {
      String json = _toJson(userLogin);
      final response = await http.post(_url, headers: _headers, body: json);
      var c = _fromjson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  UserLogin _fromjson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var userLogin = new UserLogin();
    userLogin.username = map['username'];
    userLogin.email = map['email'];
    userLogin.phone = map['phone'];
    userLogin.password = map['password'];
    userLogin.citys = map['citys'];
    return userLogin;
  }

  String _toJson(UserLogin userlogin) {
    var mapData = new Map();
    mapData['username'] = userlogin.username;
    mapData['email'] = userlogin.email;
    mapData['phone'] = userlogin.phone;
    mapData['password'] = userlogin.password;
    mapData['citys'] = userlogin.citys;
  }
}
