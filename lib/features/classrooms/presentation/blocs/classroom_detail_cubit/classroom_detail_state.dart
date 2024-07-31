part of 'classroom_detail_cubit.dart';

sealed class ClassroomDetailState extends Equatable {
  const ClassroomDetailState();

  @override
  List<Object> get props => [];
}

final class ClassroomDetailInitial extends ClassroomDetailState {}

final class ClassroomDetailLoading extends ClassroomDetailState {}

final class ClassroomDetailLoaded extends ClassroomDetailState {
  final ClassroomDetailWithSubject classroom;

  const ClassroomDetailLoaded(this.classroom);

  @override
  List<Object> get props => [classroom];
}

final class ClassroomDetailError extends ClassroomDetailState {
  final String message;

  const ClassroomDetailError(this.message);

  @override
  List<Object> get props => [message];
}
