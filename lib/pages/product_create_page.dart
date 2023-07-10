import 'package:flutter/material.dart';
import 'form/product_create_form.dart';
import 'products_page.dart';

class ProductCreatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
      ),
      body:  SingleChildScrollView(
        child: ProductCreateForm(
          onSaveProduct: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsPage()),
            );
          },
        ),
      ),
    );
  }
}