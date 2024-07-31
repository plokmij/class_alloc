import 'package:class_alloc/features/classrooms/presentation/blocs/classroom_detail_cubit/classroom_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomDetailPage extends StatefulWidget {
  const ClassroomDetailPage({
    super.key,
    required this.id,
    required this.classroomName,
  });

  final int id;
  final String classroomName;

  @override
  State<ClassroomDetailPage> createState() => _ClassroomDetailPageState();
}

class _ClassroomDetailPageState extends State<ClassroomDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ClassroomDetailCubit>().loadClassroom(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classroomName),
      ),
      body: BlocBuilder<ClassroomDetailCubit, ClassroomDetailState>(
        builder: (context, state) {
          if (state is ClassroomDetailInitial ||
              state is ClassroomDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ClassroomDetailLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Classroom Name: ${state.classroom.name}'),
                  Text('Classroom Capacity: ${state.classroom.size}'),
                ],
              ),
            );
          } else if (state is ClassroomDetailError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ClassroomDetailCubit>()
                          .loadClassroom(widget.id);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Unknown error'),
            );
          }
        },
      ),
    );
  }
}
