import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem(
      {super.key, required this.category, required this.availableMeals});

  final Category category;

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeals = availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

        Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
          return MealsScreen(
            meals: filteredMeals,
            title: category.title,
          );
        })));
      },
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.6),
              category.color.withOpacity(0.9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
