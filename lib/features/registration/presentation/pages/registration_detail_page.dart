import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/error_retry_widget.dart';
import '../../../../core/presentation/widgets/item_tile.dart';
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
        title: const Text(
          'Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<RegistrationDetailCubit, RegistrationDetailState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage!),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else if (state.deleteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Registration Deleted Successfully'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.pop();
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.registration != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ItemTile(
                      title: 'Student Details',
                      subtitle: state.registration!.student.name +
                          '\n' +
                          state.registration!.student.email,
                      trailing: Text('Age: ${state.registration!.student.age}'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ItemTile(
                      title: 'Subject Details',
                      subtitle: state.registration!.subject.name +
                          '\n' +
                          state.registration!.subject.teacher,
                      trailing: Text(
                          'Credit: ${state.registration!.subject.credits}'),
                    ),
                    Spacer(),
                    CupertinoButton(
                      color: Colors.red,
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => DeleteConfirmationDialog(
                            registrationId: widget.registrationId,
                          ),
                        );
                      },
                      child: Text('Delete Registration'),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              );
            } else if (state.errorMessage != null) {
              return ErrorRetryWidget(
                onRetryPressed: () {
                  context
                      .read<RegistrationDetailCubit>()
                      .loadRegistration(widget.registrationId);
                },
                errorMessage: state.errorMessage!,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.registrationId,
  });

  final int registrationId;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Delete'),
      content: Text(
        'Do you want to delete?',
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            context.pop();
          },
          child: Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            context.pop();
            context
                .read<RegistrationDetailCubit>()
                .deleteRegistration(registrationId);
          },
          child: Text('Delete'),
        ),
      ],
    );
  }
}
