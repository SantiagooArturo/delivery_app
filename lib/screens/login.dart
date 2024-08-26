import 'dart:math';

import 'package:delivery_app/entities/User.dart';
import 'package:delivery_app/entities/bd/ListUsers.dart';
import 'package:delivery_app/providers/session_provider.dart';
import 'package:delivery_app/screens/Home.dart';
import 'package:delivery_app/sqflite/login_token/login.model.dart';
import 'package:delivery_app/sqflite/login_token/sqflite.login.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  List<LoginModel> listUsers = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    init();
  }

  Future<void> init() async {
    listUsers = await LoginServiceSqflite.findAll();
  }

  bool validateUser(String email, String password) {
    for (User usr in Listusers) {
      if (email == usr.email && password == usr.password) {
        return true;
      }
    }

    return false;
  }

  User getUser(String email, String password) {
    for (User usr in Listusers) {
      if (email == usr.email && password == usr.password) {
        return usr;
      }
    }
    return User("", "", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      BoxForm(
                        controlador: emailController,
                        isPasword: false,
                        label: "Email",
                        placeholder: "Email",
                        validatorText: 'Please enter your email',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BoxForm(
                        controlador: passwordController,
                        isPasword: true,
                        label: "Password",
                        placeholder: "Password",
                        validatorText: 'Please enter your password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xFFfb6a57),
                            fixedSize: Size(300, 60),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                validateUser(emailController.text,
                                        passwordController.text) ==
                                    true) {
                              User usrFinal = getUser(emailController.text,
                                  passwordController.text);
                              context.read<SessionProvider>().changeUser =
                                  usrFinal;
                              Random randomKey = Random();
                              LoginModel modelSend = LoginModel(
                                token: randomKey.nextInt(100),
                                email: emailController
                                    .text, // Usa el valor del controlador
                                password: passwordController
                                    .text, // Usa el valor del controlador
                              );
                              LoginServiceSqflite.insert(modelSend);

                              context.go('/home/${usrFinal.name}');
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeFinal()));
                              print("validado");
                            } else {
                              print('no validado');
                            }
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    LoginServiceSqflite.delete(listUsers[0]);
                  },
                  child: Text('borrar'),
                ),
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(255, 220, 219, 219),
                      fixedSize: Size(300, 60),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in with Google',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(255, 220, 219, 219),
                      fixedSize: Size(300, 60),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in with Facebook',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxForm extends StatefulWidget {
  final TextEditingController controlador;
  final bool isPasword;
  final String label;
  final String placeholder;
  final validatorText;

  const BoxForm(
      {super.key,
      required this.controlador,
      required this.isPasword,
      required this.label,
      required this.placeholder,
      this.validatorText});

  @override
  State<BoxForm> createState() => _BoxFormState();
}

class _BoxFormState extends State<BoxForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          validator: (value) {
            if (widget.controlador.text.isEmpty) {
              return widget.validatorText;
            } else {
              return null;
            }
          },
          controller: widget.controlador,
          obscureText: widget.isPasword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFf1f1f1),
            labelText: widget.label,
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
