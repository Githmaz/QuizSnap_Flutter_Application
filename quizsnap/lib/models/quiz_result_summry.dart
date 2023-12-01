
import 'package:quizsnap/widgets/results_summry_card.dart';

class ResultSummaryModel {
  static List<ResultSummryCard> generateCards(List<double> percentages) {
    return percentages.map((percentage) {
      return ResultSummryCard(percentage: percentage);
    }).toList();
  }
}