import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minimarket_remi/pages/product_create_page.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('PRODUCTO').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al obtener los productos'));
          } else {
            List<Product> products = snapshot.data!.docs.map((doc) {
              return Product.fromSnapshot(doc);
            }).toList();

            return ListView.separated(
              itemCount: products.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {

                return FutureBuilder<String>(
                  future: getCategoryName(products[index].categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListTile(
                        title: Text('Cargando...'),
                      );
                    } else if (snapshot.hasError) {
                      return ListTile(
                        title: Text('Error al obtener la categoría'),
                      );
                    } else {
                      String categoryName = snapshot.data ?? 'Categoría desconocida';
                      return ListTile(
                        leading: Image(
                            height: 72.0,
                            width: 72.0,
                            image: NetworkImage(products[index].image)
                        ),
                        title: Text('#${products[index].code} - ${products[index].name}'),
                        subtitle: Text('Categoría: $categoryName'),
                        trailing: Icon(Icons.edit_rounded),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductCreatePage()),
          );
        },
      ),
    );
  }

  Future<String> getCategoryName(String categoryId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('CATEGORIAS')
        .where('id_categoria', isEqualTo: int.parse(categoryId))
        .limit(1)
        .get();
    print('Holaaaa');
    print(categoryId);
    print(snapshot.docs);

    if (snapshot.docs.isNotEmpty) {
      DocumentSnapshot categorySnapshot = snapshot.docs.first;
      Map<String, dynamic> categoryData = categorySnapshot.data() as Map<String, dynamic>;
      return categoryData['nombre'];
    } else {
      return 'Categoría desconocida';
    }
  }

}

class Product {
  final String code;
  final String name;
  final String image;
  final String categoryId;

  Product({required this.code, required this.name, required this.image, required this.categoryId});

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Product(
      code: data['id_producto'].toString() ?? '',
      name: data['nombre_producto'] ?? '',
      image: data['foto_producto'] ?? 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/046.png',
      categoryId: data['id_categoria'].toString() ?? '',
    );
  }
}
