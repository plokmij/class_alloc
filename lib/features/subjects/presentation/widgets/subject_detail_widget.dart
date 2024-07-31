import 'package:flutter/material.dart';

import '../../../../core/domain/entities/subject.dart';

class SubjectDetailWidget extends StatelessWidget {
  const SubjectDetailWidget({
    super.key,
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          child: FlutterLogo(size: 100),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          subject.name,
          style: TextStyle(fontSize: 21),
        ),
        Text(
          subject.teacher,
          style: TextStyle(
            fontSize: 21,
          ),
        ),
        Text(
          'Credit: ${subject.credits.toString()}',
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
