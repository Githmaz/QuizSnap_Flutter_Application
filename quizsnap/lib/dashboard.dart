import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizsnap/models/quiz_question.dart';
import 'package:quizsnap/pages/histroy_page.dart';
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
  List<QuizQuestion> questionsList = [];
  List<double> history = [];

  @override
  initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/questions_as_json.json');
    final data = await json.decode(response);
    setState(() {
      for (var element in data["qestionAndAnswer"]) {
        questionsList.add(QuizQuestion(
            element["qestion"], List<String>.from(element["answers"])));
      }
    });
    print("done");
  }
//________ Update the active page based on user action ____//

  void onPageChange(String value) {
    selectedAnswers.clear();
    setState(() {
      activePage = value;
    });
  }

//________ Handle answer selection during the quiz ____//

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questionsList.length) {
      setState(() {
        activePage = 'result';
      });
    }
  }

  //________ Handle try again button  ____//

  void onTryAgain() {
    selectedAnswers.clear();
  }

  //________ Save Result to the Histroy ________//
  void saveResult(double result) {
    history.add(result);
  }

  //________ Clear the Histroy ________//
  void clearHistory() {
    history.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;

    switch (activePage) {
      case 'home':
        currentPage = HomePage(startAction: onPageChange);
        break;
      case 'quiz':
        currentPage = QuizPage(
          onAnswer: onAnswerSelect,
          onBackToHome: onPageChange,
          onTryAgian: onTryAgain,
          questionsList: questionsList,
        );
        break;
      case 'result':
        currentPage = ResultPage(
          onAction: onPageChange,
          answerList: selectedAnswers,
          saveToHistory: saveResult,
          questionsList: questionsList,
        );
        break;
      case 'history':
        currentPage = HistoryPage(
          history: history,
          onAction: onPageChange,
          onClearHistory: clearHistory,
        );
        break;
      default:
        currentPage = const Center(child: Text("404 - Page Not found"));
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
