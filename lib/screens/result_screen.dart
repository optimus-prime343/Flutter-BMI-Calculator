import 'package:bmi_calculator/constants/sizes.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BMIResult;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Result'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding * 2,
          ),
          child: Column(
            children: [
              Text(
                args.bmiCategory.toUpperCase(),
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),
              Text(
                args.bmiScore.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                args.suggestion,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  HomeScreen.routeName,
                ),
                child: const Text('RECALCULATE'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
