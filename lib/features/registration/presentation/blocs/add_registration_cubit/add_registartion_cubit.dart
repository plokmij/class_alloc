import 'package:bloc/bloc.dart';
import 'package:class_alloc/core/modules/students/domain/entities/student.dart';
import 'package:class_alloc/core/modules/subjects/domain/entities/subject.dart';
import 'package:class_alloc/features/registration/domain/usecases/add_registration.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'add_registartion_state.dart';

@injectable
class AddRegistartionCubit extends Cubit<AddRegistartionState> {
  AddRegistartionCubit({
    required this.addRegistration,
  }) : super(AddRegistartionState.initial());

  final AddRegistration addRegistration;

  void selectSubject(Subject subject) {
    emit(state.copyWith(selectedSubject: subject));
  }

  void selectStudent(Student student) {
    emit(state.copyWith(selectedStudent: student));
  }

  void submit() async {
    if (!state.readyToRegister) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        errorMessage: 'Please select a student and a subject',
      ));
      return;
    }

    emit(state.copyWith(isSubmitting: true));
    try {
      final res = await addRegistration(
        AddRegistrationParams(
          subjectId: state.selectedSubject!.id,
          studentId: state.selectedStudent!.id,
        ),
      );
      res.fold(
        (failure) {
          emit(
            state.copyWith(
              isSubmitting: false,
              isSuccess: false,
              errorMessage: 'Server Error: Failed to add registration',
            ),
          );
        },
        (registration) {
          emit(
            state.copyWith(
              isSubmitting: false,
              isSuccess: true,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: 'Server Error: Failed to add registration',
        ),
      );
    }
  }

  void reset() {
    emit(AddRegistartionState.initial());
  }
}
