import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/item_tile.dart';
import '../../domain/entities/registration_details.dart';

class RegistrationDetailWidget extends StatelessWidget {
  const RegistrationDetailWidget({
    super.key,
    required this.registration,
  });

  final RegistrationDetails registration;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ItemTile(
          title: 'Student Details',
          subtitle:
              registration.student.name + '\n' + registration.student.email,
          trailing: Text('Age: ${registration.student.age}'),
        ),
        SizedBox(
          height: 8,
        ),
        ItemTile(
          title: 'Subject Details',
          subtitle:
              registration.subject.name + '\n' + registration.subject.teacher,
          trailing: Text('Credit: ${registration.subject.credits}'),
        ),
      ],
    );
  }
}
