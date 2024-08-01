import 'package:class_alloc/core/constants/textstyles_dart.dart';
import 'package:class_alloc/core/presentation/widgets/error_retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/student_detail_cubit/student_detail_cubit.dart';
import '../widgets/student_detail_body.dart';

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
        title: const Text(
          'Student Detail',
          style: kAppTileTitleTextStyle,
        ),
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
            return ErrorRetryWidget(
              onRetryPressed: () {
                context.read<StudentDetailCubit>().getStudent(widget.studentId);
              },
              errorMessage: state.message,
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
