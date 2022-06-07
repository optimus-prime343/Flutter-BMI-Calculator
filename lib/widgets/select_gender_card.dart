import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/sizes.dart';
import 'package:flutter/material.dart';

typedef OnGenderSelect = void Function(String selectedGender);

class SelectGenderCard extends StatelessWidget {
  final OnGenderSelect onGenderSelect;
  final String value;
  final IconData genderIcon;
  final bool selected;

  const SelectGenderCard({
    Key? key,
    required this.genderIcon,
    required this.value,
    required this.onGenderSelect,
    required this.selected,
  }) : super(key: key);

  Color? getColor(BuildContext context) {
    return selected
        ? Colors.white
        : Theme.of(context).textTheme.headline6?.color;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      onTap: () => onGenderSelect(value),
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 2,
        ),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : kSurfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(kDefaultBorderRadius),
          ),
        ),
        child: Column(
          children: [
            Icon(
              genderIcon,
              size: 60,
              color: getColor(context),
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: getColor(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
