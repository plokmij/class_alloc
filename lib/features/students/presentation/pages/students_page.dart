import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/students_cubit/student_cubit.dart';
import '../widgets/students_list.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            if (state is StudentInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StudentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StudentLoaded) {
              return StudentsList(students: state.students);
            } else if (state is StudentError) {
              return Column(
                children: [
                  Center(
                    child: Text(state.message),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StudentCubit>().loadStudents();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Unknown state'),
              );
            }
          },
        ),
      ),
    );
  }
}
