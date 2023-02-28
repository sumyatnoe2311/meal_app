import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import './screens/filteredScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactos": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        // if (_filters['gluten'] && !meal.isGlutenFree) {
        //   return false;
        // }
        // if (_filters['lactos'] && !meal.isLactoseFree) {
        //   return false;
        // }
        // if (_filters['vegan'] && !meal.isVegan) {
        //   return false;
        // }
        // if (_filters['vegetarian'] && !meal.isVegetarian) {
        //   return false;
        // }
        return true;
      }).toList();
    });

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodySmall: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyMedium: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ))),
        initialRoute: '/',
        routes: {
          "/": (ctx) => TabScreen(),
          CategoryMealScreen.routeName: (ctx) =>
              CategoryMealScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FilterScreen.routeName: (ctx) => FilterScreen(_setFilters),
        },
        // onGenerateRoute: ((settings) {
        //   print(settings.arguments);
        //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
        // }),
        onUnknownRoute: (settings) {
          print(settings.name);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
      );
    }
  }
}
