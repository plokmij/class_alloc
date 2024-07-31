import 'package:class_alloc/features/home/presentation/blocs/home_cubit/home_cubit.dart';
import 'package:class_alloc/features/home/presentation/widgets/home_items_grid_view.dart';
import 'package:class_alloc/features/home/presentation/widgets/home_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final homeItems = const [
    HomeItem(
      title: 'Students',
      icon: Icons.people,
      color: Colors.green,
      route: '/students', //TODO: Add route from router
    ),
    HomeItem(
      title: 'Subjects',
      icon: Icons.book,
      color: Colors.blue,
      route: '/subjects',
    ),
    HomeItem(
      title: 'Classes',
      icon: Icons.class_,
      color: Colors.orange,
      route: '/classes',
    ),
    HomeItem(
      title: 'Teachers',
      icon: Icons.person,
      color: Colors.purple,
      route: '/teachers',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IconButton(
                icon: state.isGridMode
                    ? const Icon(
                        Icons.list,
                      )
                    : const Icon(
                        Icons.grid_3x3,
                      ),
                onPressed: () {
                  context.read<HomeCubit>().toggleListingMode();
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.isListMode
                ? HomeItemsListView(items: homeItems)
                : HomeItemsGridView(items: homeItems);
          },
        ),
      ),
    );
  }
}
