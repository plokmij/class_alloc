part of 'subjects_cubit.dart';

sealed class SubjectsState extends Equatable {
  const SubjectsState();

  @override
  List<Object> get props => [];
}

final class SubjectsInitial extends SubjectsState {}

final class SubjectsLoading extends SubjectsState {}

final class SubjectsLoaded extends SubjectsState {
  final List<Subject> subjects;

  const SubjectsLoaded(this.subjects);

  @override
  List<Object> get props => [subjects];
}

final class SubjectsError extends SubjectsState {
  final String message;

  const SubjectsError(this.message);

  @override
  List<Object> get props => [message];
}
