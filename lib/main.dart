import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          headline6: Theme.of(context).textTheme.headline6?.copyWith(
                color: kMutedTextColor,
              ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ResultScreen.routeName: (context) => const ResultScreen(),
      },
    );
  }
}
