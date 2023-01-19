import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:pit02gp07/src/core/theme/app_colors.dart';

import '../../model/card_model.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.credit_card_outlined),
    label: 'Cartão',
    tooltip: 'Ir para despesas no Cartão',
  );
  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  CardType cardType = CardType.Invalid;

  void getCardTypeFrmNum() {
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  @override
  void initState() {
    cardNumberController.addListener(() {
      getCardTypeFrmNum();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        title: const Text('Novo cartão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.iceWhite)),
                      hintText: 'Número',
                      suffixIcon: CardUtils.getCardIcon(cardType),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset('assets/icons/card.svg'),
                      ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write('  ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
