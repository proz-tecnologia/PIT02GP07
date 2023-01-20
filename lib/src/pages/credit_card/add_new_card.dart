import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'components/input_formatters.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        title: const Text('Novo cartão'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Spacer(),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.iceWhite)),
                            hintText: 'Nome Cartão',
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Icon(Icons.credit_card),
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              CardMonthInputFormatter(),
                            ],
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.iceWhite)),
                              hintText: 'MM/AA',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Adicionar cartão')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
