import 'package:flutter/material.dart';
import 'package:social_recipes/widgets/products_list.dart';
import 'package:social_recipes/models/months.dart';
import 'package:social_recipes/models/vegetables.dart';
import 'package:social_recipes/models/fruits.dart';

int currentMonth = DateTime.now().month;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedMonthIndex = currentMonth - 1;

  @override
  Widget build(BuildContext context) {
    final selectedMonth = months[selectedMonthIndex];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  "Social Recipe",
                  style: TextStyle(),
                ),
              )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Recipe"),
                onTap: () {
                  Navigator.pushNamed(context, "/add");
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                },
              ),
            ],
          ),
        ),
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
            const Text("← Scroll to select the month →"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: SizedBox(
                height: 100,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: ListWheelScrollView(
                    controller:
                        FixedExtentScrollController(initialItem: currentMonth),
                    itemExtent: 100,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMonthIndex = index;
                      });
                    },
                    children: List.generate(
                      12,
                      (index) => RotatedBox(
                        quarterTurns: 1,
                        child: Center(
                          child: Text(months[index],
                              style: TextStyle(
                                  fontSize:
                                      selectedMonthIndex == index ? 20 : 18,
                                  fontWeight: selectedMonthIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: selectedMonthIndex == index
                                      ? const Color.fromARGB(255, 7, 179, 96)
                                      : Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
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
