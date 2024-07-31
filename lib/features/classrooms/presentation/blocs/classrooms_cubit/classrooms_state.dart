part of 'classrooms_cubit.dart';

sealed class ClassroomsState extends Equatable {
  const ClassroomsState();

  @override
  List<Object> get props => [];
}

final class ClassroomsInitial extends ClassroomsState {}

final class ClassroomsLoading extends ClassroomsState {}

final class ClassroomsLoaded extends ClassroomsState {
  final List<Classroom> classrooms;

  const ClassroomsLoaded(this.classrooms);

  @override
  List<Object> get props => [classrooms];
}

final class ClassroomsError extends ClassroomsState {
  final String message;

  const ClassroomsError(this.message);

  @override
  List<Object> get props => [message];
}
