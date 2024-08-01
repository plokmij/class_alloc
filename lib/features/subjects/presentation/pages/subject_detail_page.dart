import '../../../../core/constants/textstyles_dart.dart';
import '../../../../core/presentation/widgets/error_retry_widget.dart';
import '../blocs/subject_detail_cubit/subject_detail_cubit.dart';
import '../widgets/subject_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectDetailPage extends StatefulWidget {
  const SubjectDetailPage({super.key, required this.subjectId});

  final int subjectId;

  @override
  State<SubjectDetailPage> createState() => _SubjectDetailPageState();
}

class _SubjectDetailPageState extends State<SubjectDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<SubjectDetailCubit>().loadSubject(widget.subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subject Detail',
          style: kAppTileTitleTextStyle,
        ),
      ),
      body: BlocBuilder<SubjectDetailCubit, SubjectDetailState>(
        builder: (context, state) {
          if (state is SubjectDetailInitial || state is SubjectDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SubjectDetailLoaded) {
            return Center(child: SubjectDetailWidget(subject: state.subject));
          } else if (state is SubjectDetailError) {
            return ErrorRetryWidget(
              onRetryPressed: () {
                context
                    .read<SubjectDetailCubit>()
                    .loadSubject(widget.subjectId);
              },
              errorMessage: state.message,
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
