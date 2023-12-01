import 'dart:convert';
import 'package:quizsnap/models/quiz_question.dart';

List<QuizQuestion> questions = getQuestions();

List<QuizQuestion> getQuestions() {
  const jsonString = '''
    [
      {
        "question": "What are the main building blocks of Flutter UIs?",
        "answers": ["Widgets", "Components", "Blocks", "Functions"]
      },
      {
        "question": "How are Flutter UIs built?",
        "answers": [
          "By combining widgets in code",
          "By combining widgets in a visual editor",
          "By defining widgets in config files",
          "By using XCode for iOS and Android Studio for Android"
        ]
      },
      {
        "question": "What's the purpose of a StatefulWidget?",
        "answers": [
          "Update UI as data changes",
          "Update data as UI changes",
          "Ignore data changes",
          "Render UI that does not depend on data"
        ]
      },
      {
        "question": "Which widget should you try to use more often: StatelessWidget or StatefulWidget?",
        "answers": ["StatelessWidget", "StatefulWidget", "Both are equally good", "None of the above"]
      },
      {
        "question": "What happens if you change data in a StatelessWidget?",
        "answers": [
          "The UI is not updated",
          "The UI is updated",
          "The closest StatefulWidget is updated",
          "Any nested StatefulWidgets are updated"
        ]
      },
      {
        "question": "How should you update data inside of StatefulWidgets?",
        "answers": ["By calling setState()", "By calling updateData()", "By calling updateUI()", "By calling updateState()"]
      }
    ]
  ''';

  final List<dynamic> decodedJson = json.decode(jsonString);

  final List<QuizQuestion> questions = decodedJson.map((json) {
    return QuizQuestion(
      json['question'] as String,
      List<String>.from((json['answers'] as List<dynamic>).cast<String>()),
    );
  }).toList();

  return questions;
}
