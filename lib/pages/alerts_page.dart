import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      body: Center(
        child: Text(
          'Página de alertas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
