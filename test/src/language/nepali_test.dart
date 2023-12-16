import 'package:flutter_test/flutter_test.dart';
import 'package:number2words/number2words.dart';
import 'package:number2words/src/exceptions/not_a_number_expection.dart';
import 'package:number2words/src/exceptions/range_exception.dart';

void main() {
  /// Defining test cases for the code to be tested
  group('Nepali Conversion Test Coverage', () {
    /// testing for the invalid numbers entry
    test('Test NotANumberException', () {
      // Use the test function to define a test case
      const invalidNumber = '1234d56';

      /// Expecting a NotANumberException
      expect(() {
        // Code that might throw a NotANumberException
        Number2Words.convert(
          invalidNumber,
          language: Number2WordsLanguage.nepali,
        );
      },
          throwsA(
              isA<NotANumberExpection>())); // Expecting a NotANumberException
    });

    /// testing for the maximum number of digits whihc can be converted as of now=> 12 digits
    test('Test RangeError', () {
      const number = '111111111111111.11'; // 15 digits
      expect(() {
        Number2Words.convert(
          number,
          language: Number2WordsLanguage.nepali,
        );
      }, throwsA(isA<RangeErrorException>()));
    });

    /// testing the native naming system which doesn't have any wordcases applicable
    test('Convert the numbers into words in native language naming system', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "एक सय एघार रुपैया",
        1: 'एक रुपैया',
        23: 'तेइस रुपैया',
        222333: 'दुई लाख बाइस हजार तीन सय तेत्तिस रुपैया',
        1122334455:
            'एक अर्ब बाह्र करोड तेइस लाख चौँतिस हजार चार सय पचपन्न रुपैया',
        111111111111.11:
            'एक खर्ब एघार अर्ब एघार करोड एघार लाख एघार हजार एक सय एघार रुपैया, एघार पैसा',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.lowercase,
              languageNamingSystem: LanguageNamingSystem.native,
            ),
            testCases.values.toList()[i]);
      }
    });

    /// testing the semi-native conversion in lowercase
    test('Convert the numbers into words, Semi-native, lowercase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven rupees",
        1: 'one rupee',
        23: 'twenty-three rupees',
        222333:
            'two lakh twenty-two thousand three hundred thirty-three rupees',
        1122334455:
            'one arab twelve crore twenty-three lakh thirty-four thousand four hundred fifty-five rupees',
        111111111111.11:
            'one kharab eleven arab eleven crore eleven lakh eleven thousand one hundred eleven rupees and eleven paisa',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.lowercase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            ),
            testCases.values.toList()[i]);
      }
      print(
        Number2Words.convert(
          111111111111.11,
          language: Number2WordsLanguage.nepali,
          wordCase: WordCaseEnum.lowercase,
          languageNamingSystem: LanguageNamingSystem.semiNative,
        ),
      );
    });

    /// testing the semi-native conversion in uppercase
    test('Convert the numbers into words, Semi-native, uppercase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven rupees".toUpperCase(),
        1: 'one rupee'.toUpperCase(),
        23: 'twenty-three rupees'.toUpperCase(),
        222333: 'two lakh twenty-two thousand three hundred thirty-three rupees'
            .toUpperCase(),
        1122334455:
            'one arab twelve crore twenty-three lakh thirty-four thousand four hundred fifty-five rupees'
                .toUpperCase(),
        111111111111.11:
            'one kharab eleven arab eleven crore eleven lakh eleven thousand one hundred eleven rupees and eleven paisa'
                .toUpperCase(),
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.uppercase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            ),
            testCases.values.toList()[i]);
      }
    });

    /// testing the semi-native conversion in titlecase
    test('Convert the numbers into words, Semi-native, titleCase', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One Hundred Eleven Rupees",
        1: 'One Rupee',
        23: 'Twenty-three Rupees',
        222333:
            'Two Lakh Twenty-two Thousand Three Hundred Thirty-three Rupees',
        1122334455:
            'One Arab Twelve Crore Twenty-three Lakh Thirty-four Thousand Four Hundred Fifty-five Rupees',
        111111111111.11:
            'One Kharab Eleven Arab Eleven Crore Eleven Lakh Eleven Thousand One Hundred Eleven Rupees And Eleven Paisa'
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            ),
            testCases.values.toList()[i]);
      }
    });

    /// testing the semi-native conversion in sentence case
    test('Convert the numbers into words, Semi-native, sentence case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One hundred eleven rupees",
        1: 'One rupee',
        23: 'Twenty-three rupees',
        222333:
            'Two lakh twenty-two thousand three hundred thirty-three rupees',
        1122334455:
            'One arab twelve crore twenty-three lakh thirty-four thousand four hundred fifty-five rupees',
        111111111111.11:
            'One kharab eleven arab eleven crore eleven lakh eleven thousand one hundred eleven rupees and eleven paisa',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.sentenceCase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            ),
            testCases.values.toList()[i]);
      }
    });

    /// testing for international naming conversion system sentence case
    test('Convert the numbers into words, international, sentence case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One hundred eleven rupees",
        1: 'One rupee',
        23: 'Twenty-three rupees',
        222333:
            'Two hundred twenty-two thousand three hundred thirty-three rupees',
        1122334455:
            'One billion one hundred twenty-two million three hundred thirty-four thousand four hundred fifty-five rupees',
        111111111111.11:
            'One hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven rupees and eleven paisa',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.sentenceCase,
              languageNamingSystem: LanguageNamingSystem.international,
            ),
            testCases.values.toList()[i]);
      }
    });

    /// testing for international naming conversion system lowercase case
    test('Convert the numbers into words, international, lowercase case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven rupees",
        1: 'one rupee',
        23: 'twenty-three rupees',
        222333:
            'two hundred twenty-two thousand three hundred thirty-three rupees',
        1122334455:
            'one billion one hundred twenty-two million three hundred thirty-four thousand four hundred fifty-five rupees',
        111111111111.11:
            'one hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven rupees and eleven paisa',
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.lowercase,
              languageNamingSystem: LanguageNamingSystem.international,
            ),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words, international, uppercase case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "one hundred eleven rupees".toUpperCase(),
        1: 'one rupee'.toUpperCase(),
        23: 'twenty-three rupees'.toUpperCase(),
        222333:
            'two hundred twenty-two thousand three hundred thirty-three rupees'
                .toUpperCase(),
        1122334455:
            'one billion one hundred twenty-two million three hundred thirty-four thousand four hundred fifty-five rupees'
                .toUpperCase(),
        111111111111.11:
            'one hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven rupees and eleven paisa'
                .toUpperCase(),
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.uppercase,
              languageNamingSystem: LanguageNamingSystem.international,
            ),
            testCases.values.toList()[i]);
      }
    });

    test('Convert the numbers into words, international, uppercase case', () {
      /// Defining test cases for the code to be tested
      Map<num, String> testCases = {
        111: "One Hundred Eleven Rupees",
        1: 'One Rupee',
        23: 'Twenty-three Rupees',
        222333:
            'Two Hundred Twenty-two Thousand Three Hundred Thirty-three Rupees',
        1122334455:
            'One Billion One Hundred Twenty-two Million Three Hundred Thirty-four Thousand Four Hundred Fifty-five Rupees',
        111111111111.11:
            'One Hundred Eleven Billion One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven Rupees And Eleven Paisa'
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < testCases.length; i++) {
        expect(
            Number2Words.convert(
              testCases.keys.toList()[i].toString(),
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.international,
            ),
            testCases.values.toList()[i]);
      }
    });

    test('hhdf', () {
      print(Number2Words.convert(
        11123444.03,
        language: Number2WordsLanguage.nepali,
        wordCase: WordCaseEnum.titleCase,
        languageNamingSystem: LanguageNamingSystem.international,
      ));
    });
  });
}
