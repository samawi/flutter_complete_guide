import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awesome!';
    } else if (totalScore <= 12) {
      resultText = 'You are likable!';
    } else if (totalScore <= 16) {
      resultText = 'You are a bit strange!';
    } else {
      resultText = 'You are ..... strange!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart Quit'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
