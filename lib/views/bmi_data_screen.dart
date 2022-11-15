import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiData extends StatefulWidget {
  const BmiData({super.key});

  @override
  State<BmiData> createState() => _BmiDataState();
}

class _BmiDataState extends State<BmiData> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  double hitungBmi() {
    double heightMeter = height / 100;
    final bmi = weight / (heightMeter * heightMeter);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'male';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'male') ? Colors.white : primaryColor,
                      child:
                          const GenderIconText(title: 'Male', icon: Icons.male),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'female';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'female') ? Colors.white : primaryColor,
                      child: const GenderIconText(
                          title: 'Female', icon: Icons.female),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$height',
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: Colors.black,
                    activeColor: Colors.white,
                    onChanged: (val) {
                      height = val.toInt();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                age--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResult(
                      bmi: hitungBmi(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              color: const Color.fromARGB(255, 216, 98, 89),
              height: 50,
              child: const Center(
                child: Text(
                  "Hitung BMI",
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 98, 89),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor!,
          )),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        Text(title, style: labelTextStyle),
      ],
    );
  }
}
