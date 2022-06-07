import 'package:bmi_calculator/constants/sizes.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:bmi_calculator/widgets/rounded_button.dart';

import 'package:flutter/material.dart';

typedef OnValueChange = void Function(int newValue);

class CounterCard extends StatelessWidget {
  final String title;
  final int initialValue;
  final OnValueChange onValueChange;

  const CounterCard({
    Key? key,
    required this.initialValue,
    required this.title,
    required this.onValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: deviceHeight(context) * 0.015,
          ),
          Text(
            initialValue.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: deviceHeight(context) * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                icon: Icons.add,
                onTap: () => onValueChange(initialValue + 1),
              ),
              const SizedBox(
                width: 10,
              ),
              RoundedButton(
                icon: Icons.remove,
                onTap: () => onValueChange(initialValue - 1),
              )
            ],
          )
        ],
      ),
    );
  }
}
