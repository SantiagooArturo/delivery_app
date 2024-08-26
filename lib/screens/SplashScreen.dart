import 'package:delivery_app/screens/login.dart';
import 'package:delivery_app/sqflite/login_token/login.model.dart';
import 'package:delivery_app/sqflite/login_token/sqflite.login.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Obtén los datos de la base de datos y actualiza el estado
    List<LoginModel> users = await LoginServiceSqflite.findAll();

    // Navega según la presencia de datos
    Future.delayed(const Duration(seconds: 1), () {
      if (users.isEmpty) {
        print('No tiene token disponible');
        context.push('/login');
      } else {
        print('Tiene token disponible');
        context.push('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/pedidosya.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
