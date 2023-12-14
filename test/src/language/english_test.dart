import 'package:flutter_test/flutter_test.dart';

import 'package:number2words/src/language/english.dart';

void main() {
  group('English Test Coverage', () {
    test('Test the conversion less than 1000', () {
      /// Defining test cases for the code to be tested
      Map<int, String> _testCases = {
        111: "one hundred eleven",
        1: 'one',
        23: 'twenty-three',
        10: 'ten',
        999: 'nine hundred ninety-nine'
      };

      /// Runing the test cases using a loop
      for (int i = 0; i < _testCases.length; i++) {
        expect(
            Number2WordEnglish().convertLessThan1000(
                int.parse(_testCases.keys.toList()[i].toString())),
            _testCases.values.toList()[i]);
      }
    });
  });
}
