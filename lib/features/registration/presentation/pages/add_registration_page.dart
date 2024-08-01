import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/textstyles_dart.dart';
import '../../../../core/modules/students/domain/entities/student.dart';
import '../../../../core/modules/subjects/domain/entities/subject.dart';
import '../../../../core/presentation/widgets/item_tile.dart';
import '../blocs/add_registration_cubit/add_registartion_cubit.dart';
import '../blocs/registration_cubit/registration_cubit.dart';

class AddRegistrationPage extends StatefulWidget {
  const AddRegistrationPage({super.key});

  @override
  State<AddRegistrationPage> createState() => _AddRegistrationPageState();
}

class _AddRegistrationPageState extends State<AddRegistrationPage> {
  @override
  void initState() {
    super.initState();
    context.read<AddRegistartionCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Registration',
          style: kAppTileTitleTextStyle,
        ),
      ),
      body: BlocConsumer<AddRegistartionCubit, AddRegistartionState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.pop();
            context.read<RegistrationCubit>().loadRegistrations();
          } else if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage!),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (BuildContext context, AddRegistartionState state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                ItemTile(
                  onTap: () {
                    context.pushNamed('student-selection').then((value) {
                      if (value is Student) {
                        context
                            .read<AddRegistartionCubit>()
                            .selectStudent(value);
                      }
                    });
                  },
                  title: state.selectedStudent?.name ?? 'Select Student',
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 20,
                ),
                ItemTile(
                  onTap: () {
                    context.pushNamed('subject-selection').then((value) {
                      if (value is Subject) {
                        context
                            .read<AddRegistartionCubit>()
                            .selectSubject(value);
                      }
                    });
                  },
                  title: state.selectedSubject?.name ?? 'Select Subject',
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  color: Colors.green,
                  onPressed: () =>
                      context.read<AddRegistartionCubit>().submit(),
                  child: const Text('Register'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
