import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onPress});

  final String answerText;
  final void Function() onPress;

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 40, 3, 104),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
        onPressed: onPress,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
