import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifire extends StateNotifier<Map<Filter, bool>> {
  FilterNotifire()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  // void setfilters(Map<Filter, bool> choosenFilters) {
  //   state = choosenFilters;
  // }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive;// not supported
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifire, Map<Filter, bool>>((ref) {
  return FilterNotifire();
});

final filteredProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
