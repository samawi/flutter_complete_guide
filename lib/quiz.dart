import 'package:flutter/material.dart';

import 'Question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz({
    @required this.answerQuestion,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // Mapping Lists to Widgets
        // for each question, the answerText is a list of string
        // then map it to a function that returns a widget
        // the result is a list of widgets
        // then use ... to spread into an individual widget
        ...(questions[questionIndex]['answerText'] as List<String>)
            .map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
