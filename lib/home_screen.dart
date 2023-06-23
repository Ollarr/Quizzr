import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

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
