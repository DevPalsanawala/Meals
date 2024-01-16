// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.onselectScreen,
  }) : super(key: key);

  final void Function(String identifier) onselectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood_rounded,
                    size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 20),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu,
                size: 25, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22,
                  ),
            ),
            onTap: () {
              onselectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_list_alt,
                size: 25, color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22,
                  ),
            ),
            onTap: () {
              onselectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
