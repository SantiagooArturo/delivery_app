import 'package:delivery_app/screens/EditProfile.dart';
import 'package:delivery_app/sqflite/login_token/login.model.dart';
import 'package:delivery_app/sqflite/login_token/sqflite.login.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  List<LoginModel> users = [];
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    users = await LoginServiceSqflite.findAll();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Perfil'),
          subtitle: Text('Editar Perfil'),
          leading: Icon(Icons.person),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              context.push('/config/editprofile');
            },
          ),
        ),

        ListTile(
          title: Text('Cuenta'),  
          subtitle: Text('Editar Cuenta'),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

        ListTile(
          title: Text('Ayuda'),
          subtitle: Text('Ayuda'),
          leading: Icon(Icons.help),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

        ListTile(
          title: Text('Acerca de'),
          subtitle: Text('Acerca de'),
          leading: Icon(Icons.adobe_outlined),
          trailing: Icon(Icons.arrow_forward_ios),
        ),

        ListTile(
          title: Text('Configuración'),
          subtitle: Text('Configuración'),
          leading: Icon(Icons.settings),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              context.push('/config/configscreen');
            },
            ),
        ),

        ListTile(
          title: Text('Cerrar Sesión'),
          subtitle: Text('Cerrar Sesión'),
          leading: Icon(Icons.logout),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              context.push('/login');
              LoginServiceSqflite.delete(users[0]);
              print('Sesión Cerrada');
            },
          ),
        ),
      ],
    );
  }
}