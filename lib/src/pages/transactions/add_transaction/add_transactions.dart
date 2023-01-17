import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/pages/transactions/add_transaction/state/add_transaction_state.dart';
import '../../../core/theme/app_colors.dart';
import 'controller/add_transaction_controller.dart';

class AddTransactions extends StatefulWidget {
  final TransactionModel? transaction;
  final List<String> categories;
  //final List<String> accountOriginList;
  final TransactionType? type;

  const AddTransactions({
    super.key,
    this.transaction,
    required this.type,
    //required this.accountOriginList,
    this.categories = const <String>[],
  }) : assert(
          transaction != null || type != null,
          'Transaction && type can not be null at the same time',
        );

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = AddTransactionsController();
  late final TextEditingController nameController;
  late final MoneyMaskedTextController valueController;

  String category = "";

  final cubit = Modular.get<AddTransactionCubit>();

  String get type =>
      (widget.transaction?.type ?? widget.type) == TransactionType.revenue
          ? 'receita'
          : 'despesa';

  String get buttonName =>
      (widget.transaction != null) ? 'Salvar' : 'Adicionar';

  Color get colorByType =>
      (widget.transaction?.type ?? widget.type) == TransactionType.revenue
          ? AppColors.lightGreen
          : AppColors.lightRed;

  @override
  void initState() {
    category = widget.transaction?.category ?? widget.categories[1];
    nameController = TextEditingController(
      text: fillValue(
        widget.transaction?.name,
      ),
    );
    valueController = MoneyMaskedTextController(
      precision: 2,
      leftSymbol: 'R\$',
      initialValue: widget.transaction?.value ?? 0,
    );

    super.initState();
  }

  String? fillValue(String? value) {
    if (value != null && value.isNotEmpty) {
      return value;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTransactionCubit>(
      create: (context) => cubit,
      child: BlocListener<AddTransactionCubit, AddTransactionState>(
        listener: (context, state) {
          if (state is AddTransactionStateLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is AddTransactionStateSuccess) {
            Modular.to.popUntil(ModalRoute.withName('/home/'));
          } else if (state is AddTransactionStateError) {
            Navigator.pop(context);
          } else if (state is AddCategoryStateSuccess) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorByType,
            leading: BackButton(
              onPressed: () {
                Modular.to.pop();
              },
            ),
            title: Text('Adicione sua $type'),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 32,
                      ),
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
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 32,
                      ),
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
                        ),
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: 'R\$ 0.000,00',
                              filter: {'0': RegExp(r'[0-9]')}),
                        ],
                      ),
                    ),
                    if (widget.categories.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 32,
                        ),
                        child: DropDownTextField(
                          enableSearch: true,
                          dropDownList: widget.categories
                              .map(
                                (e) => DropDownValueModel(name: e, value: e),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (!widget.categories.contains('Salário')) {
                              cubit.addCategory(category: 'Salário');
                            }
                            category = value.value;
                          },
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.addTransaction(
                            transaction: TransactionModel(
                              type: widget.transaction?.type ?? widget.type!,
                              value: valueController.numberValue,
                              name: nameController.text,
                              category: category,
                              id: widget.transaction?.id,
                            ),
                          );
                        },
                        child: Text(buttonName),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
