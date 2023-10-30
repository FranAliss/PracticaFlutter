import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guia_bloc/prueba_feature.dart';
import 'package:shared_preferences/shared_preferences.dart';

class string_cubit extends Cubit<string_state> {
  string_cubit() : super(string_new(data: "Log In"));
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void addData(mail, pass) {
    if (mail == "aaa@gmail.com" && pass == "1234") {
      _prefs.then((prefs) {
        prefs.setBool('isLogin', true);
      });
      emit(string_new(data: "Logging you in"));
    } else {
      emit(string_new(data: "Login failed"));
    }
  }
}
