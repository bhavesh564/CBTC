import 'package:flutter/material.dart';

import 'package:meals_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              'Gluten-Free',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
            subtitle: Text('Only include Gluten-free meals.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              'Lactose-Free',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
            subtitle: Text('Only include Lactose-free meals.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              'Vegetarian',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
            subtitle: Text('Only include Vegetarian meals.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            title: Text(
              'Vegan',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25),
            ),
            subtitle: Text('Only include Vegan meals.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
