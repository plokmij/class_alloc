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
      route: '/students',
    ),
    HomeItem(
      title: 'Subjects',
      icon: Icons.book,
      color: Colors.blue,
      route: '/subjects',
    ),
    HomeItem(
      title: 'Classrooms',
      icon: Icons.room_outlined,
      color: Colors.redAccent,
      route: '/classrooms',
    ),
    HomeItem(
      title: 'Registration',
      icon: Icons.edit_outlined,
      color: Colors.orangeAccent,
      route: '/registration',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: kToolbarHeight * 1.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IconButton(
                icon: state.isGridMode
                    ? const Icon(
                        Icons.menu,
                      )
                    : const Icon(
                        Icons.grid_view,
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
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 40,
        ),
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

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text('Custom App Bar'),
//       toolbarHeight: height,
//     );
//   }
// }
