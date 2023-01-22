

class CreditCard {

  String? name;
  int? month;
  int? year;
  CreditCard(
    this.name,
    this.month,
    this.year,
  );

  @override
  String toString() {
    return 'CreditCard(name: $name, month: $month, year: $year,)';
  }
}
