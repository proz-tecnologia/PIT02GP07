// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'add_transaction_controller.dart';

class AddTransactions extends StatefulWidget {
  final List<String> typeList;
  final List<String> categoriesList;
  final List<String> accountTypeList;

  const AddTransactions({
    Key? key,
    required this.typeList,
    required this.categoriesList,
    required this.accountTypeList,
  }) : super(key: key);

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = AddTransactionsController();
  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final categoryController = TextEditingController();
  String dropdownType = "";
  String dropdownCategory = "";
  String dropdownAccount = "";

  @override
  initState() {
    super.initState();
    dropdownType = widget.typeList.first;
    dropdownCategory = widget.categoriesList.first;
    dropdownAccount = widget.accountTypeList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: ((title) {
                  if (title == null || title.isEmpty) {
                    return 'Adicione um nome';
                  }
                  return null;
                }),
              ),
              TextFormField(
                controller: valueController,
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um valor';
                  }
                  return null;
                }),
              ),
              DropdownButton<String>(
                value: dropdownType,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? value) {
                  setState(() {
                    dropdownType = value!;
                  });
                },
                items: widget.typeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: dropdownCategory,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? value) {
                  setState(() {
                    dropdownCategory = value!;
                  });
                },
                items: widget.categoriesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: dropdownAccount,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? value) {
                  setState(() {
                    dropdownAccount = value!;
                  });
                },
                items: widget.accountTypeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    controller.addEntry(
                      name: nameController.text,
                      stringValue: valueController.text,
                      type: dropdownType,
                      category: dropdownCategory,
                      accountOrigin: dropdownAccount,
                    ),
                  );
                },
                child: const Text(
                  'Salvar',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
