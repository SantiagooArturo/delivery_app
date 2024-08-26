import 'package:delivery_app/goRouter/gorouter.config.dart';
import 'package:delivery_app/providers/change_theme.provider.dart';
import 'package:delivery_app/providers/session_provider.dart';
import 'package:delivery_app/sqflite/login_token/sqflite.login.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LoginServiceSqflite.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()),
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: context.watch<ChangeTheme>().isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
