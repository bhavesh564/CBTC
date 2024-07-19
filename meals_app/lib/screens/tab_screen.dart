import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/provider/fav_provider.dart';
import 'package:meals_app/provider/filter_provider.dart';

const kInitialFIlters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedScreenIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void setScreen(String identifier) async {
    if (identifier == 'meals') {
      Navigator.of(context).pop();
    }
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) {
          return const FilterScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.read(filterProvider);
    final availableMeals = dummyMeals.where(
      (meal) {
        if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (activeFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activeScreenTitle = 'TasteBud Categories';
    if (_selectedScreenIndex == 1) {
      final favMeals = ref.watch(favMealsProvider);
      setState(() {
        activeScreen = MealsScreen(
          meals: favMeals,
          title: '',
        );
        activeScreenTitle = 'Your Favourites';
      });
    }
    return Scaffold(
      drawer: MainDrawer(onSelectScreen: setScreen),
      appBar: AppBar(title: Text(activeScreenTitle)),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          onTap: selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites')
          ]),
      body: activeScreen,
    );
  }
}
