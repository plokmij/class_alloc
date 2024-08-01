import 'package:class_alloc/core/constants/textstyles_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/students_cubit/student_cubit.dart';
import '../widgets/students_list.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({
    super.key,
    this.isSelectorMode = false,
  });

  final bool isSelectorMode;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Students',
          style: kAppTileTitleTextStyle,
        ),
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
              return StudentsList(
                isSelectorMode: widget.isSelectorMode,
                students: state.students,
              );
            } else if (state is StudentError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
