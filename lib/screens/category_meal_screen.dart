import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import "../models/meal.dart";

class CategoryMealScreen extends StatefulWidget {
  static final routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];

  // @override
  // void initState() {

  // }

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    categoryTitle = routeArguments['title'] as String;
    displayedMeals = widget.availableMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imgUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affortability: displayedMeals[index].affortability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      )),
    );
  }
}
