import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:social_recipes/models/merged.dart';
import 'package:social_recipes/models/categories.dart';

class AddProduct extends StatelessWidget {
  final String productName;
  const AddProduct({this.productName = "", super.key});

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
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                searchEnabled: true,
                hint: "What products are in your recipe? (max 3)",
                searchLabel: "What products are in your recipe? (max 3)",
                options: <ValueItem>[
                  ...merged.map((item) => ValueItem(label: item, value: item)),
                ],
                maxItems: 3,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    padding: EdgeInsets.all(5.0), wrapType: WrapType.wrap),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptions: [
                  if (productName.isNotEmpty)
                    ValueItem(label: productName, value: productName)
                ],
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  DropdownMenu(
                    label: const Text("Category"),
                    dropdownMenuEntries: [
                      ...categories.map((item) =>
                          DropdownMenuEntry(label: item, value: item)),
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
