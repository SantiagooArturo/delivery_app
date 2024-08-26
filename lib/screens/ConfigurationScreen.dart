import 'package:delivery_app/providers/change_theme.provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {

  @override
  Widget build(BuildContext context) {
    
    

    return  Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: SwitchListTile(
          title: Text("Modo Oscuro"),
          value: context.watch<ChangeTheme>().isDark,
          onChanged: (value) {
            setState(() {
              context.read<ChangeTheme>().changeTheme = value;
            });
            
            
          },
        ),
      ),
    );
  }
}
