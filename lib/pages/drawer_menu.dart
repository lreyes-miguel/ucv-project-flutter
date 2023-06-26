import 'package:flutter/material.dart';
import 'package:minimarket_remi/pages/categories_page.dart';
import 'package:minimarket_remi/pages/login_page.dart';
import 'package:minimarket_remi/pages/products_page.dart';
import 'package:minimarket_remi/pages/stock_page.dart';
import 'package:minimarket_remi/pages/alerts_page.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categorías'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Productos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Stock'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Alertas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Salir'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
