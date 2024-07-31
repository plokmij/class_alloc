import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: ListView.builder(
        itemCount: size ~/ 2 + size % 2,
        itemBuilder: (contex, index) {
          return Row(
            children: [
              _buildChairIcon(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Opacity(
                    opacity: 0,
                    child: _buildChairIcon(),
                  ),
                ),
              ),
              Opacity(
                opacity: (index % 2 != 0 || index != size ~/ 2) ? 1 : 0,
                child: _buildChairIcon(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildChairIcon() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Icon(Icons.person),
    );
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
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Icon(Icons.person),
        );
      },
    );
  }
}
