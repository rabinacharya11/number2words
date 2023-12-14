import 'package:number2words/src/constants/english_constants.dart';

class Number2WordEnglish {
  String convertLessThan1000(num number) {
  
    String text = '';

    if (number == 0) {
      return "zero";
    }

    final hundredPosition = number ~/ 100;

    if (hundredPosition != 0) {
      text += "${EnglishConstants.singleUnits[hundredPosition]} hundred ";
    }

    number = number % 100;

    if (number == 0) {
      return text;
    }
    if (number % 100 < 20) {
      final position = number % 100;
      text += EnglishConstants.singleUnits[int.parse(position.toString())];
    } else {
      text += EnglishConstants.tensNames[number ~/ 10];
      number = number % 10;
      if (number == 0) {
        return text;
      }
      text += '-${EnglishConstants.singleUnits[int.parse(number.toString())]}';
    }

    return text;
  }
}
