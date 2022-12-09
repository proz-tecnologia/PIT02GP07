import 'package:flutter/cupertino.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';

class TransactionsController {
  TextStyle colorByType(String type) {
    if (type == "Receita") {
      return AppTextStyle.mediumGreen;
    }
    return AppTextStyle.mediumRed;
  }
}
