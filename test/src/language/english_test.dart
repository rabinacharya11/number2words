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
          language: Number2WordsLanguage.english,
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
          language: Number2WordsLanguage.english,
        );
      }, throwsA(isA<RangeErrorException>()));
    });
    test('Convert the numbers into words in Lowercase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven dollars ",
        1: 'one dollar ',
        23: 'twenty-three dollars ',
        10: 'ten dollars ',
        999: 'nine hundred ninety-nine dollars ',
        11111111:
            'eleven million one hundred eleven thousand one hundred eleven dollars ',
        111111111111.11:
            'one hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven dollars and eleven cents ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.english,
                wordCase: WordCaseEnum.lowercase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in UpperCase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven dollars ".toUpperCase(),
        1: 'one dollar '.toUpperCase(),
        23: 'twenty-three dollars '.toUpperCase(),
        10: 'ten dollars '.toUpperCase(),
        999: 'nine hundred ninety-nine dollars '.toUpperCase(),
        11111111:
            'eleven million one hundred eleven thousand one hundred eleven dollars '
                .toUpperCase(),
        111111111111.11:
            'one hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven dollars and eleven cents '
                .toUpperCase(),
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.english,
                wordCase: WordCaseEnum.uppercase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in TitleCase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One Hundred Eleven Dollars ",
        1: 'One Dollar ',
        23: 'Twenty-three Dollars ',
        10: 'Ten Dollars ',
        999: 'Nine Hundred Ninety-nine Dollars ',
        11111111:
            'Eleven Million One Hundred Eleven Thousand One Hundred Eleven Dollars ',
        111111111111.11:
            'One Hundred Eleven Billion One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven Dollars And Eleven Cents ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.english,
                wordCase: WordCaseEnum.titleCase),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words in Sentence Case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One hundred eleven dollars ",
        1: 'One dollar ',
        23: 'Twenty-three dollars ',
        10: 'Ten dollars ',
        999: 'Nine hundred ninety-nine dollars ',
        11111111:
            'Eleven million one hundred eleven thousand one hundred eleven dollars ',
        111111111111.11:
            'One hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven dollars and eleven cents ',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(testCases.keys.toList()[i].toString(),
                language: Number2WordsLanguage.english,
                wordCase: WordCaseEnum.sentenceCase),
            testCases.values.toList()[i]);
      }
    });
  });
}
