import 'package:number2words/src/exceptions/exception.dart';

class NotANumberExpection extends Number2WordsExpection {
  final String? message;

  NotANumberExpection({this.message});

  @override
  String toString() {
    return 'NotANumberExpection: ${message ?? "The number must be a integer, double or string"}';
  }
}
