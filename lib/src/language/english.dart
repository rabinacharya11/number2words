import 'package:number2words/src/constants/currency_constants.dart';
import 'package:number2words/src/constants/english_constants.dart';
import 'package:number2words/src/enums/language_naming_system.dart';
import 'package:number2words/src/enums/word_case_enum.dart';
import 'package:number2words/src/helpers/input_validator.dart';
import 'package:number2words/src/helpers/letter_case_converter.dart';

class Number2WordEnglish {
  static String _convert3Numbers(num number) {
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

  static String convert(
    Object number, {
    bool isCurrency = true,
    WordCaseEnum wordCase = WordCaseEnum.titleCase,
    LanguageNamingSystem languageNamingSystem = LanguageNamingSystem.native,
  }) {
    String text = '';

    InputValidator.validate(number);

    number = double.parse(number.toString());

    /// Divide the number into two parts

    final parts = number.toString().split('.');

    /// The integer part of the number
    final intPartString = parts[0];

    /// The decimal part of the number
    final decimalPartString = parts.length > 1 ? parts[1] : 0;

    /// converting the String intPart to integer
    int intPart = int.parse(intPartString);
    if (intPart == 0) {
      return "zero";
    }
    if (intPart < 0) {
      text = "negative ";
      intPart = intPart.abs();
    }

    if (!isCurrency) {
      //!TODO : Implement the code for non-currency numbers
    } else {
      String stringNumber = intPart.toString().padLeft(12, '0');

      final billions = int.parse(stringNumber.substring(0, 3));
      final millions = int.parse(stringNumber.substring(3, 6));
      final thousands = int.parse(stringNumber.substring(6, 9));
      final hundreds = int.parse(stringNumber.substring(9, 12));

      if (billions != 0) {
        text += "${_convert3Numbers(billions)} billion ";
      }
      if (millions != 0) {
        text += "${_convert3Numbers(millions)} million ";
      }
      if (thousands != 0) {
        text += "${_convert3Numbers(thousands)} thousand ";
      }
      if (hundreds != 0) {
        if (hundreds == 1) {
          text +=
              "${_convert3Numbers(hundreds)} ${CurrencyConstants.englishCurrency} ";
        } else {
          text +=
              "${_convert3Numbers(hundreds)}  ${CurrencyConstants.englishCurrencyPlural} ";
        }
      }

      /// converting decimal part to integer
      int decimalPart = int.parse(decimalPartString.toString());

      if (decimalPart != 0) {
        text += 'and ';
        text += _convert3Numbers(decimalPart);
        if (decimalPart == 1) {
          text += ' cent ';
        } else {
          text += ' cents ';
        }
      }
    }
    return LetterCaseConverter.convertCase(text, wordCaseEnum: wordCase);
  }
}
