import 'package:flutter/material.dart';
import 'categories_page.dart';

class CategoryCreatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Categoría'),
      ),
      body: CategoryCreateForm(),
    );
  }
}

class CategoryCreateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Código',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            child: Text('Guardar'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
