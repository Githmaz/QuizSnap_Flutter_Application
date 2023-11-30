import 'package:flutter/material.dart';
import 'package:quizsnap/data/questions.dart';
import 'package:quizsnap/pages/home_page.dart';
import 'package:quizsnap/pages/quiz_page.dart';
import 'package:quizsnap/pages/result_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _QuizState();
}

class _QuizState extends State<Dashboard> {
  String activePage = 'home';
  List<String> selectedAnswers = [];

//________ Update the active page based on user action ____//

  void onPageChange(String value) {
    setState(() {
      activePage = value;
    });
  }

//________ Handle answer selection during the quiz ____//

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePage = 'result';
      });
    }
  }

  //________  ____//

  void onRestart(String value) {
    setState(() {
      selectedAnswers = [];
      activePage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;

    switch (activePage) {
      case 'home':
        currentPage = HomePage(onAction: onPageChange);
        break;
      case 'quiz':
        currentPage = QuizPage(onAnswer: onAnswerSelect, onAction: onPageChange);
        break;
      case 'result':
        currentPage = ResultPage(onAction: onRestart, answerList: selectedAnswers);
        break;
      default:
        currentPage = const Text("404 - Page Not found"); // Handle unknown pagxe
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: currentPage,
        ),
      ),
    );
  }
}
