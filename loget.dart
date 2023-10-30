import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class loget extends StatefulWidget {
  const loget({super.key});

  @override
  State<loget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<loget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [Text("Ayuda")],
    ));
  }
}
