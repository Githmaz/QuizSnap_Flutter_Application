import 'package:flutter/material.dart';
import 'package:quizsnap/data/questions.dart';
import 'package:quizsnap/pages/home_page.dart';
import 'package:quizsnap/pages/quiz_page.dart';
import 'package:quizsnap/pages/result_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

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
  //________ Handle try again button  ____//

  void onTryAgain(String value) {
    setState(() {
      selectedAnswers = [];
    });
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
        currentPage = QuizPage(
          onAnswer: onAnswerSelect,
          onBackToHome: onPageChange,
          onTryAgian: onTryAgain,
        );
        break;
      case 'result':
        currentPage =
            ResultPage(onAction: onRestart, answerList: selectedAnswers);
        break;
      default:
        currentPage =
            const Center(child: Text("404 - Page Not found")); 
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_page_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: currentPage,
        ),
      ),
    );
  }
}
