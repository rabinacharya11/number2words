import 'package:flutter_test/flutter_test.dart';
import 'package:number2words/src/language/english.dart';

void main() {
  group("Hindi Test Coverage", () {
    test("Hello WOrld", () {
      double i = 444.003;

      List<String> digitsParts = i.toString().split('.');
      String text = '';

      bool isCurrency = true;

      String integerPart = digitsParts[0].toString().padLeft(12, '0');
      String decimalPart = digitsParts[1].toString();

     

      // if (isCurrency) {
      //   text +=
      //     '${  Number2WordEnglish().convertLessThan1000(int.parse(integerPart))} dollars ';

      //   text +=
      //       'and ${Number2WordEnglish().convertLessThan1000(double.parse(decimalPart.substring(0,2)))} cents';
      // }

      print(text);

      // print(number);

      // print(number.substring(0, 3)); // billions

      // print(number.substring(3, 6)); //millions

      // print(number.substring(6, 9)); // thousands

      // int billions = int.parse(number.substring(3, 6));

      // if (billions != 0) {
      //   print(
      //       Number2WordEnglish().convertLessThan1000(billions) + " millions ");
      // }

      // print(number.substring(9, 12)); // hundreds
    });
  });
}
