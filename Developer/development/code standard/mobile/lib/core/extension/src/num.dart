part of "../extensions.dart";

extension NumberExtension on num {
  /// This is number formatter
  /// Type num is major type of double and int

  /// Return => 1,000,000
  String get toPriceFormat {
    int toInt = this.toInt();
    return NumberFormat("###,###,###").format(toInt);
  }

  String get toCurrencyFormat {
    return NumberFormat.simpleCurrency().format(this);
  }

  /// Return => 1,000,000.00
  String get toPriceWithDecimal {
    // Return decimal 2 position
    String decimal = (this % 1).toStringAsFixed(2).substring(1);
    int toInt = this.toInt();
    return '${NumberFormat("###,###,###").format(toInt)}$decimal';
  }

  /// If Number < 10
  /// Return example 09, 08, 07, ...
  String get toZeroPrefix => this < 10 ? '0$this' : toString();

  /// Return list generate
  List<int> get intToList {
    return List.generate(toInt(), (index) => index);
  }

  int get toPercent {
    if (this >= 100) {
      return 100;
    } else {
      return this ~/ 1;
    }
  }
}