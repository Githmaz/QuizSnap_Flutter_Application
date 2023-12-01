import 'package:flutter/material.dart';
import 'package:quizsnap/data/questions.dart';
import '../models/quiz_question_result.dart';
import '../widgets/question_result_card.dart'; // Import the QuestionResultCard

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.answerList, required this.onAction});

  final List<String> answerList;
  final Function(String value) onAction;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Result Screen',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            ...getSummary().map((result) {
              return QuestionResultCard(
                result: QuizQuestionResult(
                  question:
                      "Q${(result['questionIndex'] as int) + 1})  ${result['question']}",
                  correctAnswer: result['correct_answer'] as String,
                  userAnswer: result['user_answer'] as String,
                  userAsnwerIsCorrect:
                      result['correct_answer'] == result['user_answer'],
                  backgroundColor: const Color.fromARGB(114, 58, 58, 58),
                ),
              );
            }),
            OutlinedButton(
              onPressed: () {
                onAction('home');
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
