import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/item_tile.dart';
import '../../domain/entities/subject.dart';

class SubjectsList extends StatelessWidget {
  const SubjectsList({
    super.key,
    required this.subjects,
    required this.isSelectorMode,
  });

  final bool isSelectorMode;
  final List<Subject> subjects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Padding(
          padding:
              index != 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
          child: SubjectTile(
            onTap: () {
              if (isSelectorMode) {
                context.pop(subject.id);
                return;
              } else {
                context.push('/subjects/${subject.id}');
              }
            },
            subject: subject,
          ),
        );
      },
    );
  }
}

class SubjectTile extends StatelessWidget {
  const SubjectTile({super.key, required this.subject, required this.onTap});

  final Subject subject;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      onTap: onTap,
      title: subject.name,
      subtitle: subject.teacher,
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Credits'),
          Text('${subject.credits.toString()}'),
        ],
      ),
    );
  }
}
