import 'package:flutter/material.dart';
import 'package:quizzr/answer_button.dart';
import 'package:quizzr/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void changeQuestion() {
    setState(() {
      currentQuestionIndex = currentQuestionIndex < questions.length
          ? currentQuestionIndex++
          :
          // TODO: show result page
          0;
      // if (currentQuestionIndex < questions.length) {
      //   currentQuestionIndex++;
      // } else {
      //   currentQuestionIndex = 0;
      //   // TODO: show result page
      // }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(onPress: changeQuestion, answerText: answer);
            })
          ],
        ),
      ),
    );
  }
}
