import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

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
  static const _questions = [
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
    if (_questionIndex < _questions.length) {
      print('More question coming...');
    } else {
      print('No more question');
    }
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
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
      ),
    );
  }
}
