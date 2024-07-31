import 'package:class_alloc/core/presentation/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/modules/students/domain/entities/student.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({
    super.key,
    required this.students,
  });

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Padding(
          padding:
              index != 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
          child: StudentTile(student: student),
        );
      },
    );
  }
}

class StudentTile extends StatelessWidget {
  const StudentTile({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      onTap: () {
        context.push('/students/${student.id}');
      },
      title: student.name,
      subtitle: student.email,
      trailing: Text('Age: ${student.age.toString()}'),
    );
  }
}
