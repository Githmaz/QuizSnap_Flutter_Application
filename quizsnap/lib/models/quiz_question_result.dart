import 'package:flutter/material.dart';

class QuizQuestionResult {
  String question;
  String correctAnswer;
  String userAnswer;
  bool userAsnwerIsCorrect;
  Color backgroundColor;

  QuizQuestionResult({
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.userAsnwerIsCorrect,
    required this.backgroundColor,
  });

  static List<QuizQuestionResult> generateGroupModels(
      List<Map<String, String>> quizSummery) {
    return quizSummery.map((summary) {
      Color backgroundColor = Colors.grey;
      return QuizQuestionResult(
        question: summary["question"] ?? '',
        correctAnswer: summary["correctAnswer"] ?? '',
        userAnswer: summary["userAnswer"] ?? '',
        userAsnwerIsCorrect: summary["correctAnswer"] == summary["userAnswer"],
        backgroundColor: backgroundColor,
      );
    }).toList();
  }
}
