import 'package:number2words/src/enums/language_naming_system.dart';
import 'package:number2words/src/enums/word_case_enum.dart';
import 'package:number2words/src/constants/currency_constants.dart';
import 'package:number2words/src/constants/spanish_constants.dart';
import 'package:number2words/src/helpers/input_validator.dart';
import 'package:number2words/src/helpers/letter_case_converter.dart';

class Number2WordsSpanish {
  static String _convert3Numbers(num number) {
    String text = '';

    if (number == 0) {
      return "cero";
    }
    if (number == 100) {
      return "cien";
    }

    final hundredPosition = number ~/ 100;

    if (hundredPosition != 0) {
      text += "${SpanishConstants.centenasNames[hundredPosition]} ";
    }

    number = number % 100;

    if (number == 0) {
      return text;
    }
    if (number % 100 < 30) {
      final position = number % 100;
      text += SpanishConstants.singleUnits[int.parse(position.toString())];
    } else {
      text += SpanishConstants.tensNames[number ~/ 10];
      number = number % 10;
      if (number == 0) {
        return text;
      }
      text += ' y ${SpanishConstants.singleUnits[int.parse(number.toString())]}';
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
      return "cero";
    }
    if (intPart < 0) {
      text = "negativo ";
      intPart = intPart.abs();
    }

    String stringNumber = intPart.toString().padLeft(12, '0');

    final billions = int.parse(stringNumber.substring(0, 3));
    final millions = int.parse(stringNumber.substring(3, 6));
    final thousands = int.parse(stringNumber.substring(6, 9));
    final hundreds = int.parse(stringNumber.substring(9, 12));

    if (billions == 1) {
      text += "un mil ";
    } else if (billions > 1) {
      text += "${_convert3Numbers(billions)} mil ";
    }
    if (millions == 1) {
      text += "${_convert3Numbers(millions)} millón ";
    } else if (millions > 1) {
      text += "${_convert3Numbers(millions)} millones ";
    }
    if (thousands != 0) {
      text += "${_convert3Numbers(thousands)} mil ";
    }

    if (hundreds != 0) {
      text += "${_convert3Numbers(hundreds)} ";
      if (isCurrency && hundreds == 1) {
        text +=
            "${CurrencyConstants.spanishCurrencyNative} ";
      } else if (isCurrency) {
        text +=
            " ${CurrencyConstants.spanishCurrencyPluralNative} ";
      }
    }

    /// converting decimal part to integer
    int decimalPart = int.parse(decimalPartString.toString());

    if (decimalPart != 0) {
      text += 'con ';
      text += _convert3Numbers(decimalPart);
      if (isCurrency) {
        if (decimalPart == 1) {
          text += ' ${CurrencyConstants.spanishCurrencySubunit} ';
        } else {
          text += ' ${CurrencyConstants.spanishCurrencySubunitPlural} ';
        }
      }
    }
    return LetterCaseConverter.convertCase(text, wordCaseEnum: wordCase);
  }
}
