import 'package:number2words/src/enums/language_naming_system.dart';
import 'package:number2words/src/enums/word_case_enum.dart';

class Number2WordsSpanish {
  /// [convert] : method to convert the numbers to hindi words
  static String convert(
    Object number, {
    bool isCurrency = true,
    WordCaseEnum wordCase = WordCaseEnum.titleCase,

    /// [languageNamingSystem] : the naming system to be used to convert the numbers to words
    /// eg : native will convert 1000 to "एक हज़ार"
    ///     international will convert 100,000 to "One Lac"
    LanguageNamingSystem languageNamingSystem = LanguageNamingSystem.native,
  }) {
    String text = '';
    return text;
  }
}
