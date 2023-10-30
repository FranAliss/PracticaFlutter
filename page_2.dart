import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guia_bloc/prueba_feature.dart';
import 'package:flutter_guia_bloc/string_cubit.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page2> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: BlocProvider(
                create: (_) => string_cubit(),
                child: BlocBuilder<string_cubit, string_state>(
                    builder: (context, state) {
                  return Form(
                    key: _signInKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 60,
                            alignment: Alignment.center,
                            child: const Text("Proceso de pago",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                                onPressed: () {
                                  //context.read<string_cubit>().addData();
                                },
                                child: (state is string_new)
                                    ? Text(
                                        state.data,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    : const Text("Otro valor")),
                          )
                        ]),
                  );
                }))));
  }
}
