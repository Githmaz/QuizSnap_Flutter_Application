import 'package:flutter/material.dart';

import '../models/quiz_question_result.dart';

class QuestionResultCard extends StatelessWidget {
  final QuizQuestionResult result;

  const QuestionResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      color: result.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              result.question,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // User's Answer
          ListTile(
            leading: result.userAsnwerIsCorrect
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.close, color: Colors.red),
            title: Text(
              'Your Answer: ${result.userAnswer}',
              style: TextStyle(
                color: result.userAsnwerIsCorrect ? Colors.green : Colors.red,
              ),
            ),
          ),
          !result.userAsnwerIsCorrect
              ?

              // Correct Answer
              ListTile(
                  leading: const Icon(Icons.beenhere, color: Colors.green),
                  title: Text(
                    'Correct Answer: ${result.correctAnswer}',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
