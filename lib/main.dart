import 'package:flutter/material.dart';
import 'package:quizzr/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Quizzr"), centerTitle: true),
        body: const HomeScreen()),
  ));
}
