
enum CreditCardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}


class CreditCard {
  CreditCardType? type;
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
