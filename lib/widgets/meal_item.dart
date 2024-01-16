import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/Meal_item_Trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
    required this.OnselectedMeal,
  }) : super(key: key);

  final Meal meal;
  final void Function(Meal meal) OnselectedMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          OnselectedMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                // top: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        //long Text i....
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule_outlined,
                            label: "${meal.duration} min",
                          ),
                          const SizedBox(width: 15),
                          MealItemTrait(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                          const SizedBox(width: 15),
                          MealItemTrait(
                            icon: Icons.money,
                            label: affordabilityText,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
