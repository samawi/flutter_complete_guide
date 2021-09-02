import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  // questionsList is a list which contains Map(s)
  static const questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answerText': ['Max', 'Max', 'Max', 'Max']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
          ),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            // Mapping Lists to Widgets
            // for each question, the answerText is a list of string
            // then map it to a function that returns a widget
            // the result is a list of widgets
            // then use ... to spread into an individual widget
            ...(questions[_questionIndex]['answerText'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
