part of 'add_registartion_cubit.dart';

final class AddRegistartionState extends Equatable {
  const AddRegistartionState({
    required this.selectedSubject,
    required this.selectedStudent,
    required this.isSubmitting,
    required this.isSuccess,
    required this.errorMessage,
  });

  final Subject? selectedSubject;
  final Student? selectedStudent;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  bool get isSubjectSelected => selectedSubject != null;
  bool get isStudentSelected => selectedStudent != null;

  bool get isFailure => errorMessage != null;
  bool get readyToRegister => isSubjectSelected && isStudentSelected;

  factory AddRegistartionState.initial() {
    return AddRegistartionState(
      selectedSubject: null,
      selectedStudent: null,
      isSubmitting: false,
      isSuccess: false,
      errorMessage: null,
    );
  }

  AddRegistartionState copyWith({
    Subject? selectedSubject,
    Student? selectedStudent,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return AddRegistartionState(
      selectedSubject: selectedSubject ?? this.selectedSubject,
      selectedStudent: selectedStudent ?? this.selectedStudent,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedSubject,
        selectedStudent,
        isSubmitting,
        isSuccess,
        errorMessage,
      ];
}
