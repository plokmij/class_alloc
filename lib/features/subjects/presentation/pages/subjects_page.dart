import 'package:class_alloc/features/subjects/presentation/blocs/subjects_cubit/subjects_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects Page'),
      ),
      body: BlocBuilder<SubjectsCubit, SubjectsState>(
        builder: (context, state) {
          if (state is SubjectsInitial || state is SubjectsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SubjectsLoaded) {
            return ListView.builder(
              itemCount: state.subjects.length,
              itemBuilder: (context, index) {
                final subject = state.subjects[index];
                return ListTile(
                  title: Text(subject.name),
                  subtitle: Text(subject.teacher),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error loading subjects'),
            );
          }
        },
      ),
    );
  }
}
