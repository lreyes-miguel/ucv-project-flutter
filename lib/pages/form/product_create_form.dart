import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../products_page.dart';

class ProductCreateForm extends StatefulWidget  {
  final Function onSaveProduct;

  const ProductCreateForm({Key? key, required this.onSaveProduct}) : super(key: key);

  @override
  _ProductCreateFormState createState() => _ProductCreateFormState();
}

class _ProductCreateFormState extends State<ProductCreateForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _dimensionsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> _saveProduct() async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final int category = int.parse(_categoryController.text);
    final double price = double.parse(_priceController.text);
    final int quantity = int.parse(_quantityController.text);
    final String expiryDate = _expiryDateController.text;
    final String dimensions = _dimensionsController.text;
    final double weight = double.parse(_weightController.text);
    final String color = _colorController.text;
    final String brand = _brandController.text;
    final String sku = _skuController.text;
    final String image = _imageController.text;

    try {
      final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('PRODUCTO');

      // Crea un nuevo documento en la colección "productos" de Firestore
      await productsRef.add({
        'id_producto': Random().nextInt(100000000),
        'nombre_producto': name,
        'descripcion_producto': description,
        'id_categoria': category,
        'precio_producto': price,
        'cantidad': quantity,
        'fecha_vencimiento': expiryDate,
        'dimensiones': dimensions,
        'peso': weight,
        'color': color,
        'marca': brand,
        'sku': sku,
        'foto_producto': 'https://cdn-icons-png.flaticon.com/512/1554/1554591.png',
      });

      // La operación de escritura en Firestore fue exitosa
      print('Producto guardado en Firestore');

      // Redirige a la página de productos
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductsPage()),
      );
    } catch (e) {
      // Ocurrió un error al escribir en Firestore
      print('Error al guardar el producto en Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Descripción',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _categoryController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Categoría',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Precio',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _quantityController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cantidad disponible',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _expiryDateController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fecha de vencimiento',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _dimensionsController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Dimensiones',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _weightController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Peso',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _skuController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Marca',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _imageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Imagen',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: _saveProduct,
            child: const Text('Guardar'),
            /*onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsPage()),
              );
            },*/
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _expiryDateController.dispose();
    _dimensionsController.dispose();
    _weightController.dispose();
    _colorController.dispose();
    _brandController.dispose();
    _skuController.dispose();
    _imageController.dispose();
    super.dispose();
  }
}