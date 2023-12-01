import 'package:flutter/material.dart';
import 'package:quizsnap/data/questions.dart';
import 'package:quizsnap/widgets/parallelogram_button.dart';
import 'package:quizsnap/widgets/results_summry_card.dart';
import '../models/quiz_question_result.dart';
import '../widgets/question_result_card.dart';

class ResultPage extends StatelessWidget {
  final List<String> answerList;
  final Function(String value) onAction;

  const ResultPage(
      {super.key, required this.answerList, required this.onAction});

  List<Map<String, String>> calculateSummary() {
    List<Map<String, String>> summaryList = [];
    for (var i = 0; i < answerList.length; i++) {
      summaryList.add({
        'question': "Q${i + 1}) ${questions[i].question}",
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }

    return summaryList;
  }

  double calculatePercentage(List<Map<String, String>> summaryList) {
    int correctAnswers = summaryList
        .where((result) => result['correct_answer'] == result['user_answer'])
        .length;

    return (correctAnswers / answerList.length) * 100;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> summaryList = calculateSummary();
    double percentage = calculatePercentage(summaryList);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                ResultSummryCard(percentage: percentage),
                const SizedBox(height: 16.0),
                ...QuizQuestionResult.quizQuestionResultList(summaryList)
                    .map((result) {
                  return QuestionResultCard(result: result);
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParallelogramButton(
                  label: 'Back to Home',
                  onPressed: () {
                    onAction('home');
                  },
                  shape: "Square",
                  width: MediaQuery.of(context).size.width * 0.45,
                  buttonColor: const Color.fromARGB(255, 156, 167, 26),
                ),
                ParallelogramButton(
                  label: 'Try again',
                  onPressed: () {
                    onAction('quiz');
                  },
                  shape: "Square",
                  width: MediaQuery.of(context).size.width * 0.45,
                  buttonColor: const Color.fromARGB(255, 22, 153, 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
