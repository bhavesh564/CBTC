import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
            ])),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking Up!',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 25),
                ),
              ],
            )),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 28,
          ),
          onTap: () {
            onSelectScreen('meals');
          },
          title: Text(
            'Meals',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.filter_alt,
            size: 28,
          ),
          onTap: () {
            onSelectScreen('filters');
          },
          title: Text(
            'Filters',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20),
          ),
        )
      ]),
    );
  }
}
