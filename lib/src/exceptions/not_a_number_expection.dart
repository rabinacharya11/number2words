import 'package:number2words/src/exceptions/exception.dart';

class NotANumberExpection extends Number2WordsExpection {
  final String? message;

  NotANumberExpection({required this.message});

  @override
  String toString() {
    return 'NotANumberExpection: ${message ?? "Enter a valid number"}';
  }
}
