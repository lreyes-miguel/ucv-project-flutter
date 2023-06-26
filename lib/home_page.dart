import 'package:flutter/material.dart';
import 'package:minimarket_remi/pages/drawer_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          'Página de inicio',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}