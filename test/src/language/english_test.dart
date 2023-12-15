import 'package:flutter_test/flutter_test.dart';
import 'package:number2words/src/exceptions/not_a_number_expection.dart';
import 'package:number2words/src/exceptions/range_exception.dart';

import 'package:number2words/src/language/english.dart';

void main() {
  group('English Test Coverage', () {
    test('Test NotANumberException', () {
      // Use the test function to define a test case

      const invalidNumber = '1234s56';

      /// Expecting a NotANumberException
      expect(() {
        // Code that might throw a NotANumberException
        Number2WordEnglish.convert(invalidNumber);
      },
          throwsA(
              isA<NotANumberExpection>())); // Expecting a NotANumberException
    });

    test('Test RangeError', () {
      const number = '111111111111111.11'; // 15 digits
      expect(() {
        Number2WordEnglish.convert(number);
      }, throwsA(isA<RangeErrorException>()));
    });

    test('Convert the numbers into words', () {
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
            Number2WordEnglish.convert(
                testCases.keys.toList()[i].toString()),
            testCases.values.toList()[i]);
      }
    });
  });
}
