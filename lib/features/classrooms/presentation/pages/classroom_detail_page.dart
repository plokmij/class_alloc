import '../../../../core/constants/textstyles_dart.dart';
import '../../../../core/modules/subjects/domain/entities/subject.dart';
import '../../domain/entities/classroom_detail_with_subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/item_tile.dart';
import '../../domain/entities/classroom.dart';
import '../../domain/entities/classroom_detail.dart';
import '../blocs/classroom_detail_cubit/classroom_detail_cubit.dart';
import '../widgets/classroom_layout_widget.dart';

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
        title: Text(
          widget.classroomName,
          style: kAppTileTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: BlocBuilder<ClassroomDetailCubit, ClassroomDetailState>(
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
                    _SubjectTile(classroom: state.classroom),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        child:
                            ClassroomLayoutWidget(classroom: state.classroom),
                      ),
                    ),
                    //Text('Classroom Capacity: ${state.classroom.size}'),
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
      ),
    );
  }
}

class _SubjectTile extends StatelessWidget {
  const _SubjectTile({
    required this.classroom,
  });

  final ClassroomDetailWithSubject classroom;

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      title: classroom.hasSubject ? classroom.subject!.name : 'Add Subject',
      subtitle: classroom.hasSubject
          ? 'Subject Code: ${classroom.subject!.teacher}'
          : null,
      trailing: TextButton(
        onPressed: () async {
          context.pushNamed('subject-selection').then((value) {
            if (value is Subject) {
              context
                  .read<ClassroomDetailCubit>()
                  .changeSubject(classroom.id, value.id);
            }
          });
        },
        child: Text(
          classroom.hasSubject ? 'Change' : 'Add',
        ),
      ),
    );
  }
}
