import '../../../../core/constants/textstyles_dart.dart';
import '../../../../core/presentation/widgets/error_retry_widget.dart';
import '../blocs/subjects_cubit/subjects_cubit.dart';
import '../widgets/subjects_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({
    super.key,
    this.isSelectorMode = false,
  });

  final bool isSelectorMode;

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
        title: const Text(
          'Subjects',
          style: kAppTileTitleTextStyle,
        ),
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
                isSelectorMode: widget.isSelectorMode,
                subjects: state.subjects,
              );
            } else if (state is SubjectsError) {
              return ErrorRetryWidget(
                onRetryPressed: () {
                  context.read<SubjectsCubit>().loadSubjects();
                },
                errorMessage: state.message,
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
