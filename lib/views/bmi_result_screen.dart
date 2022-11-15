import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.bmi});

  final double bmi;

  categoryBmi(double bmiVal) {
    String category = '';
    if (bmiVal < 16) {
      category = underweightSevere;
    } else if (bmiVal < 17) {
      category = underweightModerate;
    } else if (bmiVal < 18.5) {
      category = underweightMild;
    } else if (bmiVal < 25) {
      category = normal;
    } else if (bmiVal < 30) {
      category = overweight;
    } else if (bmiVal < 35) {
      category = obeseI;
    } else if (bmiVal < 40) {
      category = obeseII;
    } else if (bmiVal >= 40) {
      category = obeseIII;
    }
    return category;
  }

  getHealtRisk(String categoryName) {
    String desc = '';
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = 'Possible nutritional deficiency and osteoporosis';
        break;
      case normal:
        desc = 'Low Risk (healthy range)';
        break;
      case overweight:
        desc = 'Moderate risk of developing heart disease, high blood pressure';
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = 'High risk of developing heart disease, high blood pressure';
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = categoryBmi(bmi);
    final bmiDesc = getHealtRisk(bmiCategory);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Hasil Perhitungan',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmiDesc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: const Color.fromARGB(255, 216, 98, 89),
              height: 50,
              child: const Center(
                child: Text(
                  "Hitung Ulang",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
