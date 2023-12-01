class QuizQuestion {
  QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;
  bool isCorrectAnswer(String selectedAnswer) {
    return answers[0] == selectedAnswer;
  }

  List<String> getRandomAnswers() {
    final randomAnswers = List.of(answers);
    randomAnswers.shuffle();
    return randomAnswers;
  }
}
