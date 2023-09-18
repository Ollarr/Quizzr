import 'package:flutter/material.dart';
import 'package:quizzr/data/questions.dart';
import 'package:quizzr/start_screen.dart';
import 'package:quizzr/questions._screen.dart';
import 'package:quizzr/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

// N/B:This is State widget that gets updated anytime the
//build method is executed (when there is a change in data).
//The leading underscore (_) precedes the identifier is a Dart-specific
//technique that indicates that this widget is only usable/accessable inside of
// this file alone and this is not just limited to State widgets, it can also be
//used to privatised methods/functions, getters, variables etc.
class _QuizScreenState extends State<QuizScreen> {
  // This is one way of initializing a variable and later assigning a value to it
  //in our case the value assigned in the initState function is a Widgetthis is dine so that
  //the activeScreen doesn't get initialize with two values when the
  //screen loads i.e having Startscreen and QuestionSCreen almost simultaneously making impossible to reference the switchScreen function method
  // Widget? activeScreen;

  // @override
  // void initState() {
  //N/B: One doesn't need wrap this inside setState because the initState function will always execute StatefulWidget's State object is initialized;
  //Flutter's (Stateful) Widget Lifecycle:
// Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).
// There are three extremely important (stateful) widget lifecycle methods you should be aware of:
  // initState(): Executed by Flutter when the StatefulWidget's State object is initialized
  // build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
  // dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

  //   activeScreen = Startscreen(switchScreen);

  //   super.initState();
  // }

  // Note: what we are trying to achieve here is that we are trying lift the logic that manages(conditionally renders the screen to display to user and then because we lifted this to a diffrent component, we then have to give whatever triggers the state change access to this function and in our case it's a button in the StartScreen)

  // Note: it's possible to assign a widget to a variable. e.g var activeScreen = HomeScreen();

  // N/B: Widgets can be assigned to variables like this i.e with type Widget like this to make unrestrictive such that it can take any value as against using var
  // Note also that functions in Dart are also regualr values and as such we can make the switchScreen function/method accessible to the
  //trigger button in the StartScreen by passing the switchScreen method to activeScreen widget which will be the StartSCreen in our case StartScreen(switchScreen) as this under the hood passes a pointer to the function as a value that can be used in StartScreen widget;
// Note that you have to also accept it as an arg in the StartScreen  Widget (i.e in the contructor) so as to make it available and accessible.
  // Widget activeScreen = const StartScreen(switchScreen)

// To do this without using the initState function, one can use a ternary expression and initialize the activeScreen like;
// The value's name i.e whatever is in the string could be any name
  var activeScreen = "start-screen";

// Then add a method to change the value of the active screen
  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = "question-screen";
    });
  }

// Initialize the available options to an empty list
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    // Then keep track of the selected answers when each questions are answered and populating them to the List
    selectedAnswers.add(answer);
    // Check if the number of answers provided and the number of questions asked are equal, if true,then navigate to result screen
    if (selectedAnswers.length == questions.length) {
      // Then add a method to change the value of the active screen again when the user has attempted all the questions
      setState(() {
        activeScreen = "result-screen";
        // Then set answers populated to the List back to an empty List
        // selectedAnswers = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    // Note that you have to also accept it as an arg in the
    //StartScreen Widget (i.e in the contructor)
    //so as to make it available and accessible.
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      // Note that you have to also accept it as an arg in the
      //QuestionScreen Widget (i.e in the contructor)
      //so as to make it available and accessible.
      // N/B: This parameter is passed like this because in QuestionScreen's widget constructor,
      //it is added to indicate that a parameter(named arg) is mandatory, and a value must be
      //provided when creating an instance of the class. It enforces that
      //the parameter cannot be null and must be provided during object initialization.
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    // N/B Scaffold and Container Widgets by default, do not take up entire available space on the screen but Center Widget do.

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
        // When initState function is used;
        // child: activeScreen,

        // Without the initState method
        // Note: This ternary expression is used here because only two conditions are involved, in our case where we are dealing with more than two conditions we therefore use the if statement instead
        // child: activeScreen == "start-screen"
        //     ? Startscreen(switchScreen)
        //     : QuestionsScreen(
        //         onSelectedAnswer: chooseAnswer,
        //       ),
        child: screenWidget,
      ),
    );
  }
}
