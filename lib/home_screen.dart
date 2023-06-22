import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 4, 91, 162),
          Color.fromARGB(255, 19, 172, 108)
        ]),
        image: DecorationImage(
          image: const AssetImage("assets/images/quiz-logo.png"),
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.dstOut,
          ),
        ),
      ),
      child: Center(
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
          label: const Text(
            "Start Quiz",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
