import 'package:number2words/src/enums/word_case_enum.dart';

class LetterCaseConverter {
  static String convertCase(String numberInWords,
      {WordCaseEnum wordCaseEnum = WordCaseEnum.sentenceCase}) {
    switch (wordCaseEnum) {
      case WordCaseEnum.lowercase:
        return numberInWords
            .toLowerCase()
            .replaceAll(RegExp('\\s+'), ' ')
            .replaceAll('\\b\\s{2,}\\b', ' ');
      case WordCaseEnum.uppercase:
        return numberInWords
            .toUpperCase()
            .replaceAll(RegExp('\\s+'), ' ')
            .replaceAll('\\b\\s{2,}\\b', ' ');
      case WordCaseEnum.titleCase:
        return numberInWords
            .split(' ')
            .map((word) {
              if (word.isNotEmpty) {
                return word[0].toUpperCase() + word.substring(1).toLowerCase();
              } else {
                return '';
              }
            })
            .join(' ')
            .replaceAll(RegExp('\\s+'), ' ')
            .replaceAll('\\b\\s{2,}\\b', ' ');
      case WordCaseEnum.sentenceCase:
        return (numberInWords.trimLeft()[0].toUpperCase() +
                numberInWords.trimLeft().substring(1).toLowerCase())
            .replaceAll(RegExp('\\s+'), ' ')
            .replaceAll('\\b\\s{2,}\\b', ' ');
      default:
        return numberInWords
            .replaceAll(RegExp('\\s+'), ' ')
            .replaceAll('\\b\\s{2,}\\b', ' ');
    }
  }
}
