import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:social_recipes/models/merged.dart';

class AddProduct extends StatelessWidget {
  final String productName;
  const AddProduct({required this.productName, super.key});

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
                options: <ValueItem>[
                  ...merged.map((item) => ValueItem(label: item, value: item)),
                ],
                maxItems: 3,
                disabledOptions: const [
                  ValueItem(label: 'Option 1', value: '1')
                ],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
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
