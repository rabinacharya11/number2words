import 'package:number2words/src/enums/language_enum.dart';
import 'package:number2words/src/enums/language_naming_system.dart';
import 'package:number2words/src/enums/word_case_enum.dart';
import 'package:number2words/src/language/english.dart';
import 'package:number2words/src/language/hindi.dart';
import 'package:number2words/src/language/nepali.dart';
import 'package:number2words/src/language/russian.dart';
import 'package:number2words/src/language/spanish.dart';

class Number2Words {
  static String convert(
    Object number, {
    bool isCurrency = true,
    WordCaseEnum wordCase = WordCaseEnum.titleCase,
    LanguageNamingSystem? languageNamingSystem,
    // = LanguageNamingSystem.native,
    Number2WordsLanguage language = Number2WordsLanguage.english,
  }) {
    switch (language) {
      case Number2WordsLanguage.english:
        return Number2WordEnglish.convert(
          number,
          isCurrency: isCurrency,
          wordCase: wordCase,
          languageNamingSystem:
              languageNamingSystem ?? LanguageNamingSystem.native,
        );

      case Number2WordsLanguage.nepali:
        return Number2WordNepali.convert(
          number,
          isCurrency: isCurrency,
          wordCase: wordCase,
          languageNamingSystem:
              languageNamingSystem ?? LanguageNamingSystem.native,
        );

      // case Number2WordsLanguage.hindi:
      //   return Number2WordsHindi.convert(
      //     number,
      //     isCurrency: isCurrency,
      //     wordCase: wordCase,
      //     languageNamingSystem:
      //         languageNamingSystem ?? LanguageNamingSystem.native,
      //   );

      // case Number2WordsLanguage.russian:
      //   return Number2WordsRussian.convert(
      //     number,
      //     isCurrency: isCurrency,
      //     wordCase: wordCase,
      //     languageNamingSystem:
      //         languageNamingSystem ?? LanguageNamingSystem.native,
      //   );

      case Number2WordsLanguage.spanish:
        return Number2WordsSpanish.convert(
          number,
          isCurrency: isCurrency,
          wordCase: wordCase,
          languageNamingSystem:
              languageNamingSystem ?? LanguageNamingSystem.native,
        );
      default:
        return Number2WordEnglish.convert(
          number,
          isCurrency: isCurrency,
          wordCase: wordCase,
          languageNamingSystem:
              languageNamingSystem ?? LanguageNamingSystem.native,
        );
    }
  }
}
