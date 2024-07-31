part of 'subject_detail_cubit.dart';

sealed class SubjectDetailState extends Equatable {
  const SubjectDetailState();

  @override
  List<Object> get props => [];
}

final class SubjectDetailInitial extends SubjectDetailState {}

final class SubjectDetailLoading extends SubjectDetailState {}

final class SubjectDetailLoaded extends SubjectDetailState {
  final Subject subject;

  const SubjectDetailLoaded(this.subject);

  @override
  List<Object> get props => [subject];
}

final class SubjectDetailError extends SubjectDetailState {
  final String message;

  const SubjectDetailError(this.message);

  @override
  List<Object> get props => [message];
}
