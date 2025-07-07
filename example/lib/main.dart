import 'package:flutter/material.dart';

/// Import the package
import 'package:number2words/number2words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// Example of usage
            Text(Number2Words.convert(
              _counter,
              language: Number2WordsLanguage.english,
              wordCase: WordCaseEnum.titleCase,
            )),

            ///  One Lakh Twenty Three Thousand Four Hundred Forty Four Rupees And Three Paisa Only

            /// Example of usage
            Text(Number2Words.convert(
              _counter,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.native
            )),

            ///  एक लाख तेइस हजार चार सय चवालिस रुपैया, तीन पैसा

            /// Example of usage
            Text(Number2Words.convert(
              _counter,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.semiNative,
            )),

            /// One Lakh Twenty-three Thousand Four Hundred Forty-four Rupees And Three Paisa

            Text(Number2Words.convert(
              _counter,
              language: Number2WordsLanguage.nepali,
              wordCase: WordCaseEnum.titleCase,
              languageNamingSystem: LanguageNamingSystem.international,
            )),

            /// Eleven Million One Hundred Twenty-three Thousand Four Hundred Forty-four Rupees And Three Paisa

            Text(
              Number2Words.convert(
                _counter,
                language: Number2WordsLanguage.nepali,
                wordCase: WordCaseEnum.titleCase,
                languageNamingSystem: LanguageNamingSystem.international,
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              Number2Words.convert(
                _counter,
                language: Number2WordsLanguage.spanish,
                wordCase: WordCaseEnum.sentenceCase,
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
