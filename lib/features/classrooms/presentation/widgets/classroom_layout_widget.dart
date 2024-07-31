import 'package:flutter/material.dart';

import '../../domain/entities/classroom_detail.dart';

class ClassroomLayoutWidget extends StatelessWidget {
  const ClassroomLayoutWidget({
    super.key,
    required this.classroom,
  });

  final ClassroomDetail classroom;

  @override
  Widget build(BuildContext context) {
    return classroom.layout.when<Widget>(
      conference: () => _ConferenceLayout(size: classroom.size),
      classroom: () => _ClassroomLayout(size: classroom.size),
    );
  }
}

class _ConferenceLayout extends StatelessWidget {
  const _ConferenceLayout({
    required this.size,
  });

  final int size;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ClassroomLayout extends StatelessWidget {
  const _ClassroomLayout({
    required this.size,
  });

  final int size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: size,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 150,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Icon(Icons.person),
          ),
        );
      },
    );
  }
}
