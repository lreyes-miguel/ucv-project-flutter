import 'package:flutter/material.dart';
import 'package:minimarket_remi/pages/category_create_page.dart';

class CategoriesPage extends StatelessWidget {
  List<Category> categories = [
    Category(id: 1, name: 'Embutidos'),
    Category(id: 2, name: 'Ropa'),
    Category(id: 3, name: 'Hogar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('ID: ${categories[index].id}'),
            subtitle: Text('Nombre: ${categories[index].name}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryCreatePage()),
          );
        }
      ),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}