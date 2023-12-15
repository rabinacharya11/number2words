import 'package:number2words/src/exceptions/exception.dart';

class RangeErrorException extends Number2WordsExpection {
  final String? message;

  RangeErrorException({this.message});

  @override
  String toString() {
    return "RangeError: ${message ?? 'The number must be less than or equal to 12 digits'}";
  }
}
