import 'package:flutter/material.dart';

import 'bmi_screen.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 57, 23, 116),
              Color.fromARGB(255, 101, 45, 198)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const BMIScreen(),
        ),
      ),
    ),
  ));
}
