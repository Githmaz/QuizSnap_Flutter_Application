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

  static List<QuizQuestionResult> quizQuestionResultList(
      List<Map<String, String>> quizSummery) {
    return quizSummery.map((result) {
      return QuizQuestionResult(
        question: "${result['question']}",
        correctAnswer: result['correct_answer'] as String,
        userAnswer: result['user_answer'] as String,
        userAsnwerIsCorrect: result['correct_answer'] == result['user_answer'],
        backgroundColor: const Color.fromARGB(114, 58, 58, 58),
      );
    }).toList();
  }
}
