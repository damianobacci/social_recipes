import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add a product")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the name of the recipe',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Link to the recipe',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  DropdownMenu(
                    label: Text("Category"),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: "entrants", label: "Entrants")
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  DropdownMenu(
                    label: Text("Category"),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: "entrants", label: "Entrants")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Add recipe"))
            ],
          ),
        ));
  }
}
