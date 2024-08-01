import 'package:class_alloc/core/presentation/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/modules/students/domain/entities/student.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({
    super.key,
    required this.students,
    required this.isSelectorMode,
  });

  final List<Student> students;
  final bool isSelectorMode;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Padding(
          padding:
              index != 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
          child: ItemTile(
            onTap: () {
              if (isSelectorMode) {
                context.pop(student);
                return;
              }
              context.push('/students/${student.id}');
            },
            title: student.name,
            subtitle: student.email,
            trailing: Text(
              'Age: ${student.age.toString()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
