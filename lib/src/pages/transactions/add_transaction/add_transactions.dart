import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'controller/add_transaction_controller.dart';

class AddTransactions extends StatefulWidget {
  final List<String> typeList;
  final List<String> categoriesList;
  final List<String> accountOriginList;

  const AddTransactions({
    Key? key,
    required this.typeList,
    required this.categoriesList,
    required this.accountOriginList,
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
  String dropdownAccountOrigin = "";

  @override
  initState() {
    super.initState();
    dropdownType = widget.typeList.first;
    dropdownCategory = widget.categoriesList.first;
    dropdownAccountOrigin = widget.accountOriginList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar operação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: ((title) {
                      if (title == null || title.isEmpty) {
                        return 'Adicione um nome';
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.border_color_rounded),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.iceWhite),
                        ),
                        hintText: 'Informe um nome para a operação.',
                        labelText: 'Adicionar um nome',
                        labelStyle: TextStyle(color: AppColors.darkGold)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: valueController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione um valor';
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.monetization_on),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.iceWhite),
                        ),
                        hintText: 'Informe o valor da operação.',
                        labelText: 'Adicione um valor',
                        labelStyle: TextStyle(color: AppColors.darkGold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      icon: Icon(Icons
                          .trending_down_rounded), //- TODO - mudar o ícone conforme o tipo da operação,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iceWhite),
                      ),
                    ),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.category_rounded),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.iceWhite))),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<String>(
                    // - mudar o ícone caso seja carteira ou caso seja cartão
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_balance_wallet_rounded),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.iceWhite),
                      ),
                    ),
                    value: dropdownAccountOrigin,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownAccountOrigin = value!;
                      });
                    },
                    items: widget.accountOriginList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        controller.addEntry(
                          name: nameController.text,
                          stringValue: valueController.text,
                          type: dropdownType,
                          category: dropdownCategory,
                          accountOrigin: dropdownAccountOrigin,
                        ),
                      );
                    },
                    child: const Text(
                      'Salvar',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
