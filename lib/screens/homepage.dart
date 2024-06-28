import 'package:flutter/material.dart';
import 'package:social_recipes/widgets/products_list.dart';
import 'package:social_recipes/models/months.dart';
import 'package:social_recipes/models/vegetables.dart';
import 'package:social_recipes/models/fruits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedMonth = months[selectedMonthIndex];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Social Recipes'),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.eco), text: 'Vegetables'),
              Tab(icon: Icon(Icons.apple), text: 'Fruits'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  ProductsList(
                    selectedMonth: selectedMonth,
                    items: vegetables[selectedMonth] ?? [],
                  ),
                  ProductsList(
                    selectedMonth: selectedMonth,
                    items: fruits[selectedMonth] ?? [],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 40,
                magnification: 10.0,
                diameterRatio: 5,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedMonthIndex = index;
                  });
                },
                physics: const BouncingScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final isSelected = index == selectedMonthIndex;
                    return Center(
                      child: Text(
                        months[index],
                        style: TextStyle(
                          fontSize: 24,
                          color: isSelected
                              ? const Color.fromARGB(255, 7, 179, 96)
                              : Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  childCount: months.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Social Recipes',
      home: HomePage(),
    );
  }
}
