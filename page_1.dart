import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guia_bloc/prueba_feature.dart';
import 'package:flutter_guia_bloc/string_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final RegExp emailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

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
                    child: const Text("Log In",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required.";
                        } else if (!emailValid.hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      controller: _emailController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: "Enter an Email",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Enter Your Password",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                          context.read<string_cubit>().addData(
                              _emailController.text, _passwordController.text);
                          Navigator.pushNamed(context, '/loget');
                          if (_signInKey.currentState!.validate()) {
                            debugPrint("Email: ${_emailController.text}");
                          }
                        },
                        child: (state is string_new)
                            ? Text(
                                state.data,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            : const Text("Otro valor")),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
