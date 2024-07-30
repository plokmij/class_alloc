part of 'student_detail_cubit.dart';

sealed class StudentDetailState extends Equatable {
  const StudentDetailState();

  @override
  List<Object> get props => [];
}

final class StudentDetailInitial extends StudentDetailState {}

final class StudentDetailLoading extends StudentDetailState {}

final class StudentDetailLoaded extends StudentDetailState {
  final Student student;

  const StudentDetailLoaded(this.student);

  @override
  List<Object> get props => [student];
}

final class StudentDetailError extends StudentDetailState {
  final String message;

  const StudentDetailError(this.message);

  @override
  List<Object> get props => [message];
}
