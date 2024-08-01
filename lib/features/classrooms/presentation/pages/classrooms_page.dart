import 'package:class_alloc/core/constants/textstyles_dart.dart';
import 'package:class_alloc/features/classrooms/presentation/blocs/classrooms_cubit/classrooms_cubit.dart';
import 'package:class_alloc/features/classrooms/presentation/widgets/classrooms_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClassroomsPage extends StatefulWidget {
  const ClassroomsPage({super.key});

  @override
  State<ClassroomsPage> createState() => _ClassroomsPageState();
}

class _ClassroomsPageState extends State<ClassroomsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ClassroomsCubit>().loadClassrooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classrooms', style: kAppTileTitleTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<ClassroomsCubit, ClassroomsState>(
          builder: (context, state) {
            if (state is ClassroomsInitial || state is ClassroomsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ClassroomsLoaded) {
              return ClassroomsListWidget(classrooms: state.classrooms);
            } else if (state is ClassroomsError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(state.message),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ClassroomsCubit>().loadClassrooms();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Unknown error'),
              );
            }
          },
        ),
      ),
    );
  }
}
