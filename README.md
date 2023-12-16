## number2words: 
Flutter Package for Converting Numbers to Words .Effortlessly transform numbers into their written counterparts with Number2Words, your go-to Flutter toolkit!

### What it Does

Number2Words takes any integer or double and delivers its accurate textual representation, seamlessly handling:

* **Large Numbers:** Can convert up to 12 digits 
* **Decimals:** Convert with precision, up to your desired decimal places.
* **Grammatical Accuracy:** Singular/plural forms, hyphens, and "and" placement are handled perfectly.
* **Customizations:** Specify the currency format, language (optional), and lettercases like Titlecase, Lowercase, UpperCase and Sentence Case

### Getting Started

1. **Add Number2Words to your `pubspec.yaml`:**

```yaml
dependencies:
  number2words: ^0.x.x # Replace `0.x.x` with the latest version
```

2. **Import the package:**

```dart
import 'package:number2words/number2words.dart';
```

3. **Convert your numbers:**

```dart 
/// For English language
final words = Number2Words.convert(1234567); 
// "One Million Two Hundred Thirty-Four Thousand Five Hundred Sixty-Seven dollars"

Number2Words.convert(1234567890),
"One Billion Two Hundred Thirty-four Million Five Hundred Sixty-seven Thousand Eight Hundred Ninety Dollars" 


Number2Words.convert(1234567.890),
"One Million Two Hundred Thirty-four Thousand Five Hundred Sixty-seven Dollars And Eighty-nine Cents"

 Number2Words.convert(111111.1),
"One Hundred Eleven Thousand One Hundred Eleven Dollars And One Cent "


 Number2Words.convert(333.33),
"Three Hundred Thirty-three Dollars And Thirty-three Cents"
```

### Contribute to Number2Words!

We welcome your contributions to improve Number2Words! Feel free to:

* **Report issues or suggest new features on the GitHub repository.**
* **Submit pull requests with bug fixes or enhancements.**
* **Share your feedback and experiences in the package discussions.**

### License

Number2Words is released under the MIT license.

We hope Number2Words becomes a valuable asset in your Flutter development toolkit!

**Happy coding!**


