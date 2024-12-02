import 'package:flutter/material.dart';

import './custom_textfield.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() {
    return _BMIScreenState();
  }
}

class _BMIScreenState extends State<BMIScreen> {
  
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  var bmiResult = '';
  String bmi = '';

  void calculateBMI(String weight, String height) {
    var weightDouble = double.parse(weight);
    var heightDouble = double.parse(height);
    setState(() {
      bmi = (weightDouble / (heightDouble * heightDouble)).toStringAsFixed(2);
      var bmiCategory = getCategory(bmi);
      bmiResult = "You are in $bmiCategory category.";
    });
  }

  String getCategory(String bmi) {
    var bmiDouble = double.parse(bmi);
    // ignore: unused_local_variable
    var category = '';
    if (bmiDouble < 18.5) {
      category = 'Underweight';
    } else if (18.5 <= bmiDouble && bmiDouble < 24.9) {
      category = 'Healthy';
    } else if (bmiDouble > 25 && bmiDouble <= 29) {
      category = 'Overweight';
    } else {
      category = 'Obese';
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text(
          'BMI Calculator ',
          style: TextStyle(
              color: Color.fromARGB(226, 252, 194, 34),
              fontSize: 24,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextfield(
            controller: weightController,
            hintText: 'Enter Weight here (in kg)'),
        const SizedBox(
          height: 20,
        ),
        CustomTextfield(
            controller: heightController, hintText: 'Enter Height here (in m)'),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            calculateBMI(weightController.text, heightController.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 252, 194, 34),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Text(
            "Calculate",
            style: TextStyle(
                color: Color.fromARGB(255, 57, 23, 116), fontSize: 24),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.deepOrange,
                Color.fromARGB(255, 221, 101, 65)
              ]),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Text(
            'BMI: $bmi',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          bmiResult,
          style: const TextStyle(
              color: Color.fromARGB(255, 252, 194, 34),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
