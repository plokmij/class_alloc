import 'package:class_alloc/features/subjects/presentation/blocs/subjects_cubit/subjects_cubit.dart';
import 'package:class_alloc/features/subjects/presentation/widgets/subjects_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SubjectsCubit>().loadSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: BlocBuilder<SubjectsCubit, SubjectsState>(
          builder: (context, state) {
            if (state is SubjectsInitial || state is SubjectsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SubjectsLoaded) {
              return SubjectsList(
                subjects: state.subjects,
              );
            } else if (state is SubjectsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Error loading subjects'),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SubjectsCubit>().loadSubjects();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
