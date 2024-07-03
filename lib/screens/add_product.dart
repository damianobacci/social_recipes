import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:social_recipes/models/merged.dart';
// import 'package:social_recipes/models/categories.dart';

class AddProduct extends StatelessWidget {
  final String productName;
  final _nameController = TextEditingController();
  final _linkController = TextEditingController();
  final _products = <String>[];
  AddProduct({this.productName = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add a product")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the name of the recipe',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _linkController,
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
                  _products.clear();
                  for (var option in options) {
                    _products.add(option.value.toString());
                  }
                },
                searchEnabled: true,
                hint: "What products are in your recipe? (max 3)",
                searchLabel: "Search for products...",
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
              // Row( // Categories can eventually be added to the mix to show recipes on the product page
              //   children: [
              //     DropdownMenu(
              //       label: const Text("Category"),
              //       dropdownMenuEntries: [
              //         ...categories.map((item) =>
              //             DropdownMenuEntry(label: item, value: item)),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    debugPrint(_linkController.text);
                    debugPrint(_nameController.text);
                    debugPrint(_products.toString());
                  },
                  child: const Text("Add recipe"))
            ],
          ),
        ));
  }
}
