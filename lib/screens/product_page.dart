import 'package:flutter/material.dart';
import 'package:social_recipes/screens/add_product.dart';

class ProductPage extends StatelessWidget {
  final String productName;
  void addRecipe() {}

  const ProductPage({required this.productName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          productName,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
