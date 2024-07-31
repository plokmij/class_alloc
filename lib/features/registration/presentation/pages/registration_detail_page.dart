import 'package:class_alloc/core/presentation/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/registration_detail_cubit/registration_detail_cubit.dart';

class RegistrationDetailPage extends StatefulWidget {
  const RegistrationDetailPage({super.key, required this.registrationId});

  final int registrationId;

  @override
  State<RegistrationDetailPage> createState() => _RegistrationDetailPageState();
}

class _RegistrationDetailPageState extends State<RegistrationDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<RegistrationDetailCubit>()
        .loadRegistration(widget.registrationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Detail'),
      ),
      body: BlocBuilder<RegistrationDetailCubit, RegistrationDetailState>(
        builder: (context, state) {
          if (state is RegistrationDetailInitial ||
              state is RegistrationDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegistrationDetailLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemTile(
                    title: 'Student Details',
                    subtitle: state.registration.student.name +
                        '\n' +
                        state.registration.student.email,
                    trailing: Text('Age: ${state.registration.student.age}'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ItemTile(
                    title: 'Subject Details',
                    subtitle: state.registration.subject.name +
                        '\n' +
                        state.registration.subject.teacher,
                    trailing:
                        Text('Credit: ${state.registration.subject.credits}'),
                  ),
                ],
              ),
            );
          } else if (state is RegistrationDetailError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.message),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<RegistrationDetailCubit>()
                          .loadRegistration(widget.registrationId);
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
