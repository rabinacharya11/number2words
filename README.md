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

 /// Example of usage
            Number2Words.convert(
              123444.03,
              language: Number2WordsLanguage.english,
              wordCase: WordCaseEnum.titleCase,
            ),
            ///  One Lakh Twenty Three Thousand Four Hundred Forty Four Rupees And Three Paisa Only

            /// Example of usage
            Number2Words.convert(
              123444.03,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.native
            ),

            ///  एक लाख तेइस हजार चार सय चवालिस रुपैया, तीन पैसा

            /// Example of usage
            Number2Words.convert(
              123444.03,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            ),

            /// One Lakh Twenty-three Thousand Four Hundred Forty-four Rupees And Three Paisa

          Number2Words.convert(
              11123444.03,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.international,
            ),

            /// Eleven Million One Hundred Twenty-three Thousand Four Hundred Forty-four Rupees And Three Paisa
```

### Contribute to Number2Words!

We welcome your contributions to improve Number2Words! Feel free to:

* **Report issues or suggest new features on the GitHub repository.**
* **Submit pull requests with bug fixes or enhancements.**
* **Share your feedback and experiences in the package discussions.**

### License

Number2Words is released under the MIT license.

We hope number2words becomes a valuable asset in your Flutter development toolkit!

**Happy coding!**


