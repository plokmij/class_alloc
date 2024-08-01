import 'package:class_alloc/core/presentation/widgets/error_retry_widget.dart';
import 'package:class_alloc/features/registration/presentation/blocs/registration_cubit/registration_cubit.dart';
import 'package:class_alloc/features/registration/presentation/widgets/registrations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationsPage extends StatefulWidget {
  const RegistrationsPage({super.key});

  @override
  State<RegistrationsPage> createState() => _RegistrationsPageState();
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<RegistrationCubit>().loadRegistrations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  if (state is RegistrationInitial ||
                      state is RegistrationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RegistrationLoaded) {
                    if (state.registrations.isEmpty) {
                      return const Center(
                        child: Text(
                          'No data',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else {
                      return RegistrationsList(
                          registrations: state.registrations);
                    }
                  } else if (state is RegistrationError) {
                    return ErrorRetryWidget(
                      onRetryPressed: () {
                        context.read<RegistrationCubit>().loadRegistrations();
                      },
                      errorMessage: state.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    backgroundColor: Colors.blue.shade100,
                  ),
                  onPressed: () {
                    context.push('/registration/add');
                  },
                  child: Text(
                    'New Registration',
                    style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
