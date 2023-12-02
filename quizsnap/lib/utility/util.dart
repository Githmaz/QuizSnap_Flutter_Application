import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quizsnap/models/quiz_question.dart';

Future<void> readJson(List<QuizQuestion> questionsList) async {
  final String response =
      await rootBundle.loadString('assets/data/questions_as_json.json');
  final data = await json.decode(response);

  for (var element in data["qestionAndAnswer"]) {
    List<String> answers = List<String>.from(element["answers"]);
    questionsList.add(QuizQuestion(element["qestion"], answers));
  }
}
