import 'package:flutter/material.dart';

import '../../domain/entities/student.dart';

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          child: Icon(
            Icons.person,
            size: 100,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          student.name,
          style: TextStyle(fontSize: 21),
        ),
        Text(
          'Age: ${student.age.toString()}',
          style: TextStyle(
            fontSize: 21,
          ),
        ),
        Text(
          student.email,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
