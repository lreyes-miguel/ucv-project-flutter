import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock'),
      ),
      body: Center(
        child: Text(
          'Página de stock',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
