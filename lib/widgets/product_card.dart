import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  const ProductCard(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
