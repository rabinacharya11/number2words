import 'package:number2words/src/exceptions/exception.dart';

class RangeError extends Number2WordsExpection {
  final String? message;

  RangeError({this.message});

  @override
  String toString() {
    return "RangeError: ${message ?? 'Out of Range, Please check your inputs'}";
  }
}
