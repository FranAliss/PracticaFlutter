import 'package:flutter_guia_bloc/loget.dart';
import 'package:flutter_guia_bloc/page_1.dart';
import 'package:flutter_guia_bloc/page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guia_bloc/localAuth.dart';

void main() {
  runApp(const Auth());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mi aPP', home: Page1(), routes: {
      '/login': (context) => Page1(),
      '/loget': (context) => loget()
    });
  }
}
