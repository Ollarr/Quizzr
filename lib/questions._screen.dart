import 'package:flutter/material.dart';
import 'package:quizzr/answer_button.dart';
import 'package:quizzr/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  // onSelectedAnswer is a an argument that is accepted here as an arg as a pointer
  //to make the chooseAnswer function/method available and accesible to the button that triggers it.
  //N/B Whatever name you give to it is up to you
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // N/B: this is done because the onSelectAnswer constructor property only is available in the
    //QuestionsScreen widget and therefore to make accesible in this widget that extends
    //the QuestionsScreen, we have use this in-built widget
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      // currentQuestionIndex = currentQuestionIndex < questions.length
      //     ? currentQuestionIndex ++ // Increment when less than the length
      //     : 0; // Reset to 0 when it reaches the length

      //     then show result page

      // if (currentQuestionIndex < questions.length) {
      //   currentQuestionIndex++;
      // } else {
      //   currentQuestionIndex = 0;
      //  then show result page
      // }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      // N/B COntainers by default, do not take up entire available space on the screen
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
            // The SizedBox built-in Widget is mostly used to add space between two items(stacked or placed beside each other)
            const SizedBox(height: 30),
            // The spread operator is used here because what the children arg expects is a
            //list of widget but in our case, it is getting list that contains another list,
            //so what this spread operator essentially does is to pull all the items/values
            //in a list/iterable and add them as a standalone comma seperated items/value to a parent/surrounding list
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  onPress: () {
                    // The answerQuestion function here takes the answers selected for each of the question as an arg
                    answerQuestion(answer);
                  },
                  answerText: answer);
            })
          ],
        ),
      ),
    );
  }
}
