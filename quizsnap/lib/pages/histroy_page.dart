import 'package:flutter/material.dart';
import 'package:quizsnap/models/quiz_result_summry.dart';
import 'package:quizsnap/widgets/parallelogram_button.dart';
import 'package:quizsnap/widgets/results_summry_card.dart';

class HistoryPage extends StatelessWidget {
  final List<double> history;
  final Function(String value) onAction;
  final VoidCallback onClearHistory;

  const HistoryPage({
    super.key,
    required this.history,
    required this.onAction,
    required this.onClearHistory,
  });

  @override
  Widget build(BuildContext context) {
    List<ResultSummryCard> resultCards =
        ResultSummaryModel.generateCards(history); // Generate result cards

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Color.fromARGB(255, 240, 243, 33),
                  Color.fromARGB(255, 94, 176, 39)
                ],
              ).createShader(bounds);
            },
            child: const Text(
              'History',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white, // You can set the text color here
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (history.isEmpty)
            const Text(
              'No history available.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: resultCards.length,
                itemBuilder: (context, index) {
                  return resultCards[
                      index]; // Use ResultSummryCard widget directly
                },
              ),
            ),
          const SizedBox(height: 20),
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
                  width: history.isEmpty
                      ? MediaQuery.of(context).size.width * 0.9
                      : MediaQuery.of(context).size.width * 0.45,
                  buttonColor: const Color.fromARGB(255, 156, 167, 26),
                ),
                history.isEmpty
                    ? const SizedBox()
                    : ParallelogramButton(
                        label: 'Clear History',
                        onPressed: () {
                          onClearHistory();
                          onAction('home');
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

// ElevatedButton(
//             onPressed: () {
//             },
//             child: const Text('Back to Home'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               onClearHistory();
//             },
//             child: const Text('Clear History'),
//           ),