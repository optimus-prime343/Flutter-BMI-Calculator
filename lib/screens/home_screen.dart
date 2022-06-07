import 'package:bmi_calculator/constants/sizes.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/counter_card.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:bmi_calculator/widgets/select_gender_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String bmiCategory;
  String gender = '';
  int age = 0;
  double height = 0;
  int weight = 0;

  void heightChange(double newHeight) {
    setState(() {
      height = newHeight;
    });
  }

  void setGender(String selectedGender) {
    setState(() {
      gender = selectedGender;
    });
  }

  void weightChange(int newWeight) {
    if (newWeight > 0) {
      setState(() {
        weight = newWeight;
      });
    }
  }

  void ageChaneg(int newAge) {
    if (newAge > 0) {
      setState(() {
        age = newAge;
      });
    }
  }

  String getTreatMentSuggestion() {
    final Map<String, String> suggestions = {
      'Underweight':
          'Being underweight can be a concern if it’s the result of poor nutrition or if you are pregnant. So if you are underweight, see your doctor or dietitian for an evaluation to plan how to meet your goal weight.',
      'Normal Weight':
          'You are at a healty weight for your height.By Maintaining a healty weight, you lower your risk of developing serious health problems.',
      'Overweight':
          'You should try to stick with your healthy eating plan and continue getting regular physical activity while taking weight-loss medicines.',
      'Obesity':
          'Having specific goals can help you stay on track. Rather than “be more active,” set a goal to walk 15 to 30 minutes before work or at lunch on Monday and Friday. If you miss a walk on Monday, pick it up again Tuesday.',
    };
    return suggestions[bmiCategory] as String;
  }

  void calculateBMI() {
    double bmi = (weight * 703) / (height * height);
    if (bmi < 18.5) bmiCategory = 'Underweight';
    if (bmi > 18.5 && bmi < 24.9) bmiCategory = 'Normal Weight';
    if (bmi > 25 && bmi < 29.9) bmiCategory = 'Overweight';
    if (bmi > 30) bmiCategory = 'Obesity';

    BMIResult bmiResult = BMIResult(
      suggestion: getTreatMentSuggestion(),
      bmiCategory: bmiCategory,
      bmiScore: bmi,
    );
    Navigator.of(context).pushNamed(
      ResultScreen.routeName,
      arguments: bmiResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SelectGenderCard(
                      genderIcon: Icons.male,
                      value: 'Male',
                      onGenderSelect: setGender,
                      selected: gender == 'Male',
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: SelectGenderCard(
                      genderIcon: Icons.female,
                      value: 'Female',
                      onGenderSelect: setGender,
                      selected: gender == 'Female',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight(context) * 0.015,
              ),
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'HEIGHT',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          height.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const Text('cm'),
                      ],
                    ),
                    Slider(
                      value: height,
                      onChanged: heightChange,
                      max: 200,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CounterCard(
                      title: 'Weight',
                      initialValue: weight,
                      onValueChange: weightChange,
                    ),
                  ),
                  Expanded(
                    child: CounterCard(
                      title: 'Age',
                      initialValue: age,
                      onValueChange: ageChaneg,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight(context) * 0.015,
              ),
              SizedBox(
                width: double.infinity,
                height: deviceHeight(context) * 0.07,
                child: ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(),
                  child: const Text('CALCULATE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
