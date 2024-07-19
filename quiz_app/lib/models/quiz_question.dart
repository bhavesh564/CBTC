// import 'package:flutter/material.dart';/

class QuizQuestion {
  const QuizQuestion(
    this.ques,
    this.answers,
  );

  final String ques;
  final List<String> answers;

  String get correctAnswer => answers[0];

  List<String> shuffledList() {
    final List<String> copyList = List.of(answers);
    copyList.shuffle();
    return copyList;
  }
}
