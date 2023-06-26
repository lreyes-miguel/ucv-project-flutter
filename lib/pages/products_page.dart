import 'package:flutter/material.dart';
import 'package:minimarket_remi/pages/product_create_page.dart';

class ProductsPage extends StatelessWidget {
  List<Product> products = [
    Product(code: 'P001', name: 'Producto 1', category: 'Electrónica'),
    Product(code: 'P002', name: 'Producto 2', category: 'Ropa'),
    Product(code: 'P003', name: 'Producto 3', category: 'Hogar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Código: ${products[index].code}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${products[index].name}'),
                Text('Categoría: ${products[index].category}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductCreatePage()),
          );
        }, // Sin funcionalidad
      ),
    );
  }
}

class Product {
  final String code;
  final String name;
  final String category;

  Product({required this.code, required this.name, required this.category});
}