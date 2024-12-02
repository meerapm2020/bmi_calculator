import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {required this.controller, required this.hintText, super.key});

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(166, 227, 223, 240),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 246, 245, 251),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(166, 227, 223, 240), fontSize: 18),
        ),
        style: const TextStyle(
            color: Color.fromARGB(255, 196, 195, 195), fontSize: 21),
        controller: controller,
        onTapOutside: (PointerDownEvent pointerDownEvent) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
