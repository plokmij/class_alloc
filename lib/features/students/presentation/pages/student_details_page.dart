import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/student.dart';
import '../blocs/student_detail_cubit/student_detail_cubit.dart';

class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({
    super.key,
    required this.studentId,
  });

  final int studentId;

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<StudentDetailCubit>().getStudent(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Detail'),
      ),
      body: BlocBuilder<StudentDetailCubit, StudentDetailState>(
        builder: (context, state) {
          if (state is StudentDetailInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StudentDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StudentDetailLoaded) {
            return Center(
              child: StudentDetailWidget(
                student: state.student,
              ),
            );
          } else if (state is StudentDetailError) {
            return Column(
              children: [
                Center(
                  child: Text(state.message),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<StudentDetailCubit>()
                        .getStudentById(widget.studentId);
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
    );
  }
}

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          child: Icon(
            Icons.person,
            size: 100,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          student.name,
          style: TextStyle(fontSize: 21),
        ),
        Text(
          'Age: ${student.age.toString()}',
          style: TextStyle(
            fontSize: 21,
          ),
        ),
        Text(
          student.email,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
