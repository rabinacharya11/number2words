import 'package:flutter_test/flutter_test.dart';
import 'package:number2words/number2words.dart';
import 'package:number2words/src/exceptions/not_a_number_expection.dart';
import 'package:number2words/src/exceptions/range_exception.dart';

void main() {
  group('English Test Coverage', () {
    test('Test NotANumberException', () {
      // Use the test function to define a test case

      const invalidNumber = '1234s56';

      /// Expecting a NotANumberException
      expect(() {
        // Code that might throw a NotANumberException
        Number2Words.convert(
          invalidNumber,
          language: Number2WordsLanguage.spanish,
        );
      },
          throwsA(
              isA<NotANumberExpection>())); // Expecting a NotANumberException
    });

    test('Test RangeError', () {
      const number = '111111111111111.11'; // 15 digits
      expect(() {
        Number2Words.convert(
          number,
          language: Number2WordsLanguage.spanish,
        );
      }, throwsA(isA<RangeErrorException>()));
    });
    test('Convert the numbers into words in Lowercase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "ciento once dollars ",
        100: 'cien dollars ',
        1: 'un dollar ',
        23: 'veintitrés dollars ',
        10: 'diez dollars ',
        999: 'novecientos noventa y nueve dollars ',
        11111111:
            'once millones ciento once mil ciento once dollars ',
        111111111111.11:
            'ciento once mil ciento once millones ciento once mil ciento once dollars con once centavos ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.spanish,
                wordCase: WordCaseEnum.lowercase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in UpperCase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: 'ciento once dollars '.toUpperCase(),
        100: 'cien dollars '.toUpperCase(),
        1: 'un dollar '.toUpperCase(),
        23: 'veintitrés dollars '.toUpperCase(),
        10: 'diez dollars '.toUpperCase(),
        999: 'novecientos noventa y nueve dollars '.toUpperCase(),
        11111111:
            'once millones ciento once mil ciento once dollars '.toUpperCase(),
        111111111111.11:
            'ciento once mil ciento once millones ciento once mil ciento once dollars con once centavos '
              .toUpperCase(),
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.spanish,
                wordCase: WordCaseEnum.uppercase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in TitleCase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "Ciento Once Dollars ",
        1: 'Un Dollar ',
        23: 'Veintitrés Dollars ',
        10: 'Diez Dollars ',
        999: 'Novecientos Noventa Y Nueve Dollars ',
        11111111:
            'Once Millones Ciento Once Mil Ciento Once Dollars ',
        111111111111.11:
            'Ciento Once Mil Ciento Once Millones Ciento Once Mil Ciento Once Dollars Con Once Centavos ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.spanish,
                wordCase: WordCaseEnum.titleCase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in Sentence Case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "Ciento once dollars ",
        1: 'Un dollar ',
        23: 'Veintitrés dollars ',
        10: 'Diez dollars ',
        999: 'Novecientos noventa y nueve dollars ',
        11111111:
            'Once millones ciento once mil ciento once dollars ',
        111111111111.11:
            'Ciento once mil ciento once millones ciento once mil ciento once dollars con once centavos ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.spanish,
                wordCase: WordCaseEnum.sentenceCase),
            testCases.values.toList()[i]);
      }
    });
  });
}
