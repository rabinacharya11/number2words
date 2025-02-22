import 'package:number2words/src/constants/currency_constants.dart';
import 'package:number2words/src/constants/english_constants.dart';
import 'package:number2words/src/constants/nepali_constants.dart';
import 'package:number2words/src/enums/language_naming_system.dart';
import 'package:number2words/src/enums/word_case_enum.dart';
import 'package:number2words/src/helpers/input_validator.dart';
import 'package:number2words/src/helpers/letter_case_converter.dart';

/// [Number2WordNepali] will be responsible for converting the number to words in Nepali
class Number2WordNepali {
  static String _convertLessThan1000(
    Object number, {
    required LanguageNamingSystem languageNamingSystem,
  }) {
    String text = '';

    if (number == 0) {
      return "zero";
    }
    num.parse(number.toString());
    number as num;
    final hundredPosition = number ~/ 100;

    if (hundredPosition != 0) {
      switch (languageNamingSystem) {
        case LanguageNamingSystem.native:
          text += "${NepaliConstants.singleUnitsNative[hundredPosition]} सय ";
          break;

        case LanguageNamingSystem.semiNative:
          text +=
              "${NepaliConstants.singleUnitsNativeEnglishStyle[hundredPosition]} hundred ";

          break;
        case LanguageNamingSystem.international:
          text +=
              "${NepaliConstants.singleUnitsNativeEnglishStyle[hundredPosition]} hundred ";
          break;
        default:
      }
    }

    number = number % 100;

    if (number == 0) {
      return text;
    }

    if (languageNamingSystem == LanguageNamingSystem.native) {
      text += NepaliConstants.singleUnitsNative[int.parse(number.toString())];
    } else if (number % 100 < 20) {
      final position = number % 100;
      switch (languageNamingSystem) {
        case LanguageNamingSystem.semiNative:
          text += NepaliConstants
              .singleUnitsNativeEnglishStyle[int.parse(position.toString())];

          break;
        case LanguageNamingSystem.international:
          text += NepaliConstants
              .singleUnitsNativeEnglishStyle[int.parse(position.toString())];
          break;
        default:
      }
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
    LanguageNamingSystem languageNamingSystem = LanguageNamingSystem.native,
    WordCaseEnum wordCase = WordCaseEnum.titleCase,
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

      if (languageNamingSystem == LanguageNamingSystem.native ||
          languageNamingSystem == LanguageNamingSystem.semiNative) {
        int kharab = int.parse(stringNumber.substring(0, 1));
        int arab = int.parse(stringNumber.substring(1, 3));
        int crore = int.parse(stringNumber.substring(3, 5));
        int lakh = int.parse(stringNumber.substring(5, 7));
        int thousand = int.parse(stringNumber.substring(7, 9));
        int hundred = int.parse(stringNumber.substring(9, 12));

        if (kharab != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text += "${NepaliConstants.singleUnitsNative[kharab]} खर्ब ";
              break;

            case LanguageNamingSystem.semiNative:
              kharab = kharab % 100;
              if (kharab < 20) {
                text +=
                    '${NepaliConstants.singleUnitsNativeEnglishStyle[kharab]} kharab ';
              } else {
                text += EnglishConstants.tensNames[kharab ~/ 10];
                kharab = kharab % 10;
                if (kharab == 0) {
                  text += ' kharab ';
                } else {
                  text += '-${EnglishConstants.singleUnits[kharab]} kharab ';
                }
              }
              break;
            default:
              text += "${NepaliConstants.singleUnitsNative[kharab]} खर्ब ";
              break;
          }
        }

        if (arab != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text += "${NepaliConstants.singleUnitsNative[arab]} अर्ब ";
              break;

            case LanguageNamingSystem.semiNative:
              arab = arab % 100;
              if (arab < 20) {
                text +=
                    '${NepaliConstants.singleUnitsNativeEnglishStyle[arab]} arab ';
              } else {
                text += EnglishConstants.tensNames[arab ~/ 10];
                arab = arab % 10;
                if (arab == 0) {
                  text += ' arab ';
                } else {
                  text += '-${EnglishConstants.singleUnits[arab]} arab ';
                }
              }
              break;
            default:
              text += "${NepaliConstants.singleUnitsNative[arab]} अर्ब ";
              break;
          }
        }

        if (crore != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text += "${NepaliConstants.singleUnitsNative[crore]} करोड ";
              break;

            case LanguageNamingSystem.semiNative:
              crore = crore % 100;
              if (crore < 20) {
                text +=
                    '${NepaliConstants.singleUnitsNativeEnglishStyle[crore]} crore ';
              } else {
                text += EnglishConstants.tensNames[crore ~/ 10];
                crore = crore % 10;
                if (crore == 0) {
                  text += ' crore ';
                } else {
                  text += '-${EnglishConstants.singleUnits[crore]} crore ';
                }
              }

              break;
            default:
              text += "${NepaliConstants.singleUnitsNative[crore]} करोड ";
              break;
          }
        }

        if (lakh != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text += "${NepaliConstants.singleUnitsNative[lakh]} लाख ";
              break;

            case LanguageNamingSystem.semiNative:
              lakh = lakh % 100;
              if (lakh < 20) {
                text +=
                    '${NepaliConstants.singleUnitsNativeEnglishStyle[lakh]} lakh ';
              } else {
                text += EnglishConstants.tensNames[lakh ~/ 10];
                lakh = lakh % 10;
                if (lakh == 0) {
                  text += ' lakh ';
                } else {
                  text += '-${EnglishConstants.singleUnits[lakh]} lakh ';
                }
              }

              break;
            default:
              text += "${NepaliConstants.singleUnitsNative[lakh]} लाख ";
              break;
          }
        }
        if (thousand != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text += "${NepaliConstants.singleUnitsNative[thousand]} हजार ";
              break;

            case LanguageNamingSystem.semiNative:
              thousand = thousand % 100;

              if (thousand < 20) {
                text +=
                    '${NepaliConstants.singleUnitsNativeEnglishStyle[thousand]} thousand ';
              } else {
                text += EnglishConstants.tensNames[thousand ~/ 10];
                thousand = thousand % 10;
                if (thousand == 0) {
                  text += ' thousand ';
                } else {
                  text +=
                      '-${EnglishConstants.singleUnits[thousand]} thousand ';
                }
              }
              break;
            default:
              text += "${NepaliConstants.singleUnitsNative[thousand]} हजार ";
              break;
          }
        }

        if (hundred != 0) {
          switch (languageNamingSystem) {
            case LanguageNamingSystem.native:
              text +=
                  "${_convertLessThan1000(hundred, languageNamingSystem: languageNamingSystem)} रुपैया";
              break;

            case LanguageNamingSystem.semiNative:
              if (hundred == 1) {
                text +=
                    "${_convertLessThan1000(hundred, languageNamingSystem: languageNamingSystem)} ${CurrencyConstants.nepaliIndianCurrencyInternational}";
              } else {
                text +=
                    "${_convertLessThan1000(hundred, languageNamingSystem: languageNamingSystem)}  ${CurrencyConstants.nepaliIndianCurrencyInternationalPlural}";
              }
              break;
            default:
              text +=
                  "${_convertLessThan1000(hundred, languageNamingSystem: languageNamingSystem)} रुपैया";
              break;
          }
        }
      } else {
        final billions = int.parse(stringNumber.substring(0, 3));
        final millions = int.parse(stringNumber.substring(3, 6));
        final thousands = int.parse(stringNumber.substring(6, 9));
        final hundreds = int.parse(stringNumber.substring(9, 12));

        if (billions != 0) {
          text +=
              "${_convertLessThan1000(billions, languageNamingSystem: languageNamingSystem)} billion ";
        }
        if (millions != 0) {
          text +=
              "${_convertLessThan1000(millions, languageNamingSystem: languageNamingSystem)} million ";
        }
        if (thousands != 0) {
          text +=
              "${_convertLessThan1000(thousands, languageNamingSystem: languageNamingSystem)} thousand ";
        }
        if (hundreds != 0) {
          if (hundreds == 1) {
            text +=
                "${_convertLessThan1000(hundreds, languageNamingSystem: languageNamingSystem)} ${CurrencyConstants.nepaliIndianCurrencyInternational}";
          } else {
            text +=
                "${_convertLessThan1000(hundreds, languageNamingSystem: languageNamingSystem)}  ${CurrencyConstants.nepaliIndianCurrencyInternationalPlural}";
          }
        }
      }
    }

    // converting decimal part to integer
    int decimalPart = int.parse(decimalPartString.toString());

    if (decimalPart != 0) {
      if (languageNamingSystem == LanguageNamingSystem.native) {
        text += ', ';
      } else {
        text += ' and ';
      }
      text += _convertLessThan1000(decimalPart,
          languageNamingSystem: languageNamingSystem);
      switch (languageNamingSystem) {
        case LanguageNamingSystem.native:
          text += ' पैसा';

          break;

        case LanguageNamingSystem.semiNative:
          text += ' paisa';

          break;
        case LanguageNamingSystem.international:
          text += ' paisa';
          break;
        default:
          text += ' पैसा';
      }
    }

    return LetterCaseConverter.convertCase(text, wordCaseEnum: wordCase);
  }
}
