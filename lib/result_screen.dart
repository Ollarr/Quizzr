// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzr/data/questions.dart';
import 'package:quizzr/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryDataMethod = getSummaryData();
    final totalNumOfQuestions = questions.length;
    final numOfCorrectAnswers = summaryDataMethod.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // widget like this that interpolates variables generated dynamically, do not allow the use const
              Text(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, // Style for question text
                      color: Colors.white70),
                  "You answered $numOfCorrectAnswers out of $totalNumOfQuestions questions correctly!"),
              const SizedBox(
                height: 30,
              ),
              // const Text("List of answers and questions"),
              // QuestionSummary(getSummaryData()),
              QuestionSummary(summaryDataMethod),

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                // N/B: const cannot be added to the TextButton Widget
                child: TextButton(
                  onPressed: restartQuiz,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 40, 3, 104),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: Colors.white), // Add an icon
                      SizedBox(width: 8.0), // Add spacing between icon and text
                      Text(
                        "Restart quiz",
                        style: TextStyle(color: Colors.white), // Set text color
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
