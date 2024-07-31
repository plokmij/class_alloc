import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/subject.dart';

class SubjectsList extends StatelessWidget {
  const SubjectsList({
    super.key,
    required this.subjects,
  });

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
          child: SubjectTile(subject: subject),
        );
      },
    );
  }
}

class SubjectTile extends StatelessWidget {
  const SubjectTile({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      elevation: 0,
      child: ListTile(
        onTap: () {
          context.push('/subjects/${subject.id}');
        },
        title: Text(subject.name),
        subtitle: Text(subject.teacher),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Credits'),
            Text('${subject.credits.toString()}'),
          ],
        ),
      ),
    );
  }
}
