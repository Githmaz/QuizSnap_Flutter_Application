import 'package:flutter/material.dart';
import 'package:quizsnap/widgets/answer_button_widget.dart';
import 'package:quizsnap/data/questions.dart';
import 'package:quizsnap/widgets/custom_alert_dialog.dart';

import '../widgets/parallelogram_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.onAnswer,
    required this.onBackToHome,
    required this.onTryAgian,
  });

  final Function(String value) onAnswer;
  final Function(String value) onBackToHome;
  final Function(String value) onTryAgian;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Q${currentQuestionIndex + 1}) ${questions[currentQuestionIndex].question}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontFamily: 'YourCustomFont',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ...questions[currentQuestionIndex]
                .getRandomAnswers()
                .map((answer) => [
                      AnswerButton(
                        value: answer,
                        onAnswer: () {
                          answerQuestion(answer);
                        },
                        buttonColor: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                    ])
                .expand((element) => element),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ParallelogramButton(
                    label: 'Back to Home',
                    onPressed: () {
                      currentQuestionIndex > 0
                          ? showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                  type: "Yes",
                                  alertTitle: "Confirm Navigation",
                                  alertContent:
                                      "Are you sure you want to go back to the home screen? Your progress will be lost.",
                                  yesButton: () {
                                    restartQuiz();
                                    widget.onBackToHome('home');
                                  }),
                            )
                          : widget.onBackToHome('home');
                    },
                    shape: currentQuestionIndex > 0
                        ? "right-trapezoid"
                        : "left-parallelogram",
                    width: currentQuestionIndex > 0
                        ? MediaQuery.of(context).size.width * 0.45
                        : MediaQuery.of(context).size.width * 0.9,
                    buttonColor: const Color.fromARGB(255, 128, 126, 7),
                  ),
                  currentQuestionIndex > 0
                      ? ParallelogramButton(
                          label: 'Restart',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                type: "Yes",
                                alertTitle: "Restart Quiz",
                                alertContent:
                                    "Are you sure you want to restart the quiz? Your progress will be lost.",
                                yesButton: () {
                                  restartQuiz();
                                },
                              ),
                            );
                          },
                          shape: "left-trapezoid",
                          width: MediaQuery.of(context).size.width * 0.45,
                          buttonColor: const Color.fromARGB(255, 8, 121, 8),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
