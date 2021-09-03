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
  var _totalScore = 0;

  // questionsList is a list which contains Map(s)
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': [
        {'text': 'Rabit', 'score': 10},
        {'text': 'Snake', 'score': 7},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answerText': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    this._totalScore += score;

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
                answerQuestion:
                    _answerQuestion, // forward the pointer of a function
                questions: _questions, // forward the List of _questions
                questionIndex:
                    _questionIndex, // forward the value of _questionIndex
              )
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}
