// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CreditCard {
  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;
  CreditCard({
    this.type,
    this.number,
    this.name,
    this.month,
    this.year,
    this.cvv,
  });

  @override
  String toString() {
    return 'CreditCard(type: $type, number: $number, name: $name, month: $month, year: $year, cvv: $cvv)';
  }
}

class CardUtils {
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    if (value.length < 3 || value.length < 4) {
      return 'CVV inválido!';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.fieldReq;
    }

    int year;
    int month;

    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1;
    }
    if ((month < 1) || (month > 12)) {
      return 'Mês inválido!';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return 'Ano inválido!';
    }

    if (!hasDateExpired(month, year)) {
      return 'Cartão já expirou!';
    }
    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiredDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();

    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();

    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r'[^0-9]');
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = '';
    Icon? icon;
    switch (cardType) {
      case CardType.mastercard:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.elo:
        img = 'elo.png';
        break;
      case CardType.americanExpress:
        img = 'americaExpress.png';
        break;
      case CardType.otherBrand:
        icon = const Icon(Icons.credit_card, size: 24.0);
        break;
      default:
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      int digit = int.parse(input[length - 1 - 1]);

      if (i % 2 == 1) {
        digit *= 2;
      }

      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }
    return Strings.numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.mastercard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.length <= 8) {
      cardType = CardType.otherBrand;
    }
    return cardType;
  }
}
