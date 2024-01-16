import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/screens/Categoriesscreen.dart';
import 'package:meals/screens/Meals.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/widgets/main_Drawer.dart';

class Tabscreen extends ConsumerStatefulWidget {
  const Tabscreen({super.key});

  @override
  ConsumerState<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends ConsumerState<Tabscreen> {
  int _selectedindex = 0;

//  for tabs
  void _selectpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

//  for drawer

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredProvider);

    Widget activepage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activepagetitle = 'Categories';

    if (_selectedindex == 1) {
      final favoriteMeals = ref.watch(favoruiteMealsProvider);
      activepage = MealScreen(
        meals: favoriteMeals,
      );
      activepagetitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(onselectScreen: _selectScreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favorites"),
        ],
      ),
    );
  }
}
