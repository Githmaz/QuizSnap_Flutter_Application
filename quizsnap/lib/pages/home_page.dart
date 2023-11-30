import 'package:flutter/material.dart';

import '../widgets/parallelogram_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/quizsanp_logo.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to QuizSnap!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          const Text(
            'Let\'s embark on an exciting journey of quizzes and knowledge!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          ParallelogramButton(
            label: 'Start Quiz',
            onPressed: () {
              onAction('quiz');
            },
            side: "left",
            width: 150,
            buttonColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
