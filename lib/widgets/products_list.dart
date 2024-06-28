import 'package:flutter/material.dart';
import 'package:social_recipes/screens/product_page.dart';
import 'package:social_recipes/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  final String selectedMonth;
  final List<String> items;

  const ProductsList(
      {required this.selectedMonth, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(productName: items[index]),
                ),
              );
            },
            child: ProductCard(items[index]),
          );
        },
      ),
    );
  }
}
