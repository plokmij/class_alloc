import 'package:class_alloc/core/ui/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/classroom.dart';

class ClassroomsListWidget extends StatelessWidget {
  const ClassroomsListWidget({
    super.key,
    required this.classrooms,
  });

  final List<Classroom> classrooms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classrooms.length,
      itemBuilder: (context, index) {
        final classroom = classrooms[index];
        return Padding(
          padding:
              index != 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
          child: _ClassroomTile(classroom: classroom),
        );
      },
    );
  }
}

class _ClassroomTile extends StatelessWidget {
  const _ClassroomTile({required this.classroom});

  final Classroom classroom;

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      onTap: () {
        context.push(
          '/classrooms/${classroom.id}',
          extra: classroom.name,
        );
      },
      title: classroom.name,
      subtitle: classroom.layout.name,
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${classroom.size.toString()}'),
          Text('Seats'),
        ],
      ),
    );
  }
}
