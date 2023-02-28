import "package:flutter/material.dart";
import "package:meal_app/widgets/main_drawer.dart";

class FilterScreen extends StatefulWidget {
  static final routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;

  bool _vegan = false;

  bool _vegetarian = false;

  bool lactoseFree = false;

  Widget _buildSwitchListTile(
      String title,
      String subTitle,
      bool currentValue,
      Function updateValue
    ) {
    return SwitchListTile(
      onChanged: updateValue(),
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten Free", "Only include gluten free meals.", _glutenFree, () {
                setState(() {
                  _glutenFree = true;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
