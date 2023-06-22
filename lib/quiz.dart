import 'package:flutter/material.dart';
import "package:quizzr/home_screen.dart";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Quizzr"), centerTitle: true),
        body: const HomeScreen());
  }
}
