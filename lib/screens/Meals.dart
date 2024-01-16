// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/Meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    Key? key,
    this.title,
    required this.meals,
  }) : super(key: key);

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailmealScreen(
        meal: meal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    /////
    Widget contant = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "Uh...ohh Nothing heare!",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          "Try selecting a different category",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ]),
    );
    //////////
    if (meals.isNotEmpty) {
      contant = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
              meal: meals[index],
              OnselectedMeal: (meal) {
                selectMeal(context, meal);
              });
        },
      );
    }
    ////
    if (title == null) {
      return contant;
    }
    ///////
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: contant,
    );
  }
}
