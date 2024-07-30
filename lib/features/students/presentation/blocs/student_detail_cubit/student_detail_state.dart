part of 'student_detail_cubit.dart';

sealed class StudentDetailState extends Equatable {
  const StudentDetailState();

  @override
  List<Object> get props => [];
}

final class StudentDetailInitial extends StudentDetailState {}
