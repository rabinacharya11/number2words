import 'package:number2words/src/exceptions/not_a_number_expection.dart';
import 'package:number2words/src/exceptions/range_exception.dart';

class InputValidator {
  /// returns [true] if the input contains consecutive double dots
  bool _hasConsecutiveDoubleDots(Object input) {
    RegExp regex = RegExp(r'\.\.');
    return regex.hasMatch(input.toString());
  }

  /// returns [true] if the input is a valid number
  bool _isValidNumber(Object input) {
    RegExp regex = RegExp(r'^(?=.*\d)[\d.]+$');
    return regex.hasMatch(input.toString());
  }

  /// returns [true] if the input has letters in it
  bool _hasLetters(Object input) {
    RegExp regex = RegExp(r'\d+[a-zA-Z]+\d+');
    return regex.hasMatch(input.toString());
  }

  /// returns [true] if the input has special characters in it
  bool _hasSpecialCharacters(Object input) {
    RegExp regex = RegExp(r'^(?=.*\d)[\d.]+$');
    return !regex.hasMatch(input.toString());
  }

  /// returns [true] if the input is not a number, string or double
  bool _hasCorrectDataType(Object input) {
    return input is! num && input is! String && input is! double;
  }

  /// returns [true] if the input passes all the validation tests
  static bool validate(Object input) {
    /// checks the length of the input
    if (input.toString().split('.')[0].length > 12) {
      throw RangeErrorException();
    }

    InputValidator validator = InputValidator();
    if (validator._hasConsecutiveDoubleDots(input)) {
      throw NotANumberExpection();
    } else if (validator._hasLetters(input)) {
      throw NotANumberExpection();
    } else if (validator._hasSpecialCharacters(input)) {
      throw NotANumberExpection();
    } else if (!validator._isValidNumber(input)) {
      throw NotANumberExpection();
    } else if (validator._hasCorrectDataType(input)) {
      throw NotANumberExpection();
    } else {
      return true;
    }
  }
}
