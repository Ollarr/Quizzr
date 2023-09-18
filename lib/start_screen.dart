import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // startQuiz is a positional argument(Positional arguments are the values that are passed to a function in the order they are declared) that is accepted here as an arg as a pointer
  //to make the switchScreen function/method available and accesible to the button that triggers it.
  //N/B Whatever name you give to it is up to you
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: startQuiz,
        icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
        label: const Text(
          "Start Quiz",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
