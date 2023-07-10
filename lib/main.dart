import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minimarket_remi/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimarket Remi',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.green[700],
          secondary: Colors.green[700],
        ),
      ),
      home: LoginPage(),
    );
  }
}