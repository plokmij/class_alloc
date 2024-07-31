import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/item_tile.dart';
import '../../domain/entities/registration.dart';

class RegistrationsList extends StatelessWidget {
  const RegistrationsList({
    super.key,
    required this.registrations,
  });

  final List<Registration> registrations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registrations.length,
      itemBuilder: (context, index) {
        final registration = registrations[index];
        return Padding(
          padding:
              index != 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
          child: RegistrationTile(
            onTap: () {
              context.push('/registrations/${registration.id}');
            },
            registration: registration,
          ),
        );
      },
    );
  }
}

class RegistrationTile extends StatelessWidget {
  const RegistrationTile({
    super.key,
    required this.registration,
    required this.onTap,
  });

  final Registration registration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ItemTile(
      onTap: onTap,
      title: 'Registration Id: #${registration.id}',
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
