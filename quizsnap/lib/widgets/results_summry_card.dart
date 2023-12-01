import 'package:flutter/material.dart';

class ResultSummryCard extends StatelessWidget {
  final double percentage;

  const ResultSummryCard({super.key, required this.percentage});

  String getFeedback() {
    if (percentage >= 90) {
      return "Wow, you're a genius! 🌟 Keep shining!";
    } else if (percentage >= 75) {
      return "Well done! 🚀 You're doing great!";
    } else if (percentage >= 50) {
      return "Good job! 📚 Keep it up!";
    } else if (percentage >= 35) {
      return "You're making progress! 🔥 Keep practicing!";
    } else if (percentage > 0) {
      return "Oops! 😅 Keep going, you'll get there!";
    } else {
      return "🫡 Really bro ? Really ??";
    }
  }

  Color getColor() {
    if (percentage >= 75) {
      return Colors.green;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else if (percentage >= 35) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      color: const Color.fromARGB(191, 0, 7, 52),
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getColor(),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Center(
                    child: Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 185, 8, 8),
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              getFeedback(),
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 77, 157, 222),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
