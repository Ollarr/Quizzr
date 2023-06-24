import 'package:flutter/material.dart';
import "package:quizzr/home_screen.dart";
import 'package:quizzr/questions._screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  // Note: it's possible to assign a widget to a variable. e.g var activeScreen = HomeScreen();
  // var activeScreen = "start-screen";
// This is one way of initializing a variable and later assigning a value to it, in our case the value assigned in the iniState function is a Widget.
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);

  //   super.initState();
  // }

// To do this without using the initState function, one can use a ternary expression.
  var activeScreen = "home-screen";

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quizzr"), centerTitle: true),
      body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 4, 91, 162),
              Color.fromARGB(255, 19, 172, 108)
            ]),
            image: DecorationImage(
              image: const AssetImage("assets/images/quiz-logo.png"),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9),
                BlendMode.dstOut,
              ),
            ),
          ),
          child: activeScreen == "home-screen"
              ? HomeScreen(switchScreen)
              : const QuestionsScreen()),
    );
  }
}
