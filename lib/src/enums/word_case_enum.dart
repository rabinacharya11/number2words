///
///
/// [WordCaseEnum] will define the letter capatilization of words
///
///
enum WordCaseEnum {
  ///[uppercase] this will convert every words to uppercase
  ///eg. `nine` will be converted to `NINE`
  uppercase,

  ///[lowercase] this will covert every words to lowercase
  /// eg. `NiNe` will be converted to `nine`
  lowercase,

  ///[sentenceCase] this will convert the first letter of the first word in a
  /// sentence to capital letter
  ///
  /// eg.  `one hundred one` will be converted to `One hundred one`
  sentenceCase,

  ///[titleCase] this will convert the first letter of every word to capital letter
  ///
  /// eg `one hundred one ` will be converted to `One Hundred One`
  titleCase,
}
