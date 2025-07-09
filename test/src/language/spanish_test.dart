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
        111: "ciento once dólares ",
        100: 'cien dólares ',
        1: 'un dólar ',
        23: 'veintitrés dólares ',
        10: 'diez dólares ',
        999: 'novecientos noventa y nueve dólares ',
        2604.75: 'dos mil seiscientos cuatro dólares con setenta y cinco centavos ',
        11111111:
            'once millones ciento once mil ciento once dólares ',
        111111111111.11:
            'ciento once mil ciento once millones ciento once mil ciento once dólares con once centavos ',
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
        111: 'ciento once dólares '.toUpperCase(),
        100: 'cien dólares '.toUpperCase(),
        1: 'un dólar '.toUpperCase(),
        23: 'veintitrés dólares '.toUpperCase(),
        10: 'diez dólares '.toUpperCase(),
        999: 'novecientos noventa y nueve dólares '.toUpperCase(),
        11111111:
            'once millones ciento once mil ciento once dólares '.toUpperCase(),
        111111111111.11:
            'ciento once mil ciento once millones ciento once mil ciento once dólares con once centavos '
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
        111: "Ciento Once Dólares ",
        1: 'Un Dólar ',
        23: 'Veintitrés Dólares ',
        10: 'Diez Dólares ',
        999: 'Novecientos Noventa Y Nueve Dólares ',
        11111111:
            'Once Millones Ciento Once Mil Ciento Once Dólares ',
        111111111111.11:
            'Ciento Once Mil Ciento Once Millones Ciento Once Mil Ciento Once Dólares Con Once Centavos ',
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
        111: "Ciento once dólares ",
        1: 'Un dólar ',
        23: 'Veintitrés dólares ',
        10: 'Diez dólares ',
        999: 'Novecientos noventa y nueve dólares ',
        11111111:
            'Once millones ciento once mil ciento once dólares ',
        111111111111.11:
            'Ciento once mil ciento once millones ciento once mil ciento once dólares con once centavos ',
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
