part of 'registration_detail_cubit.dart';

sealed class RegistrationDetailState extends Equatable {
  const RegistrationDetailState();

  @override
  List<Object> get props => [];
}

final class RegistrationDetailInitial extends RegistrationDetailState {}

final class RegistrationDetailLoading extends RegistrationDetailState {}

final class RegistrationDetailLoaded extends RegistrationDetailState {
  final RegistrationDetails registration;

  RegistrationDetailLoaded(this.registration);

  @override
  List<Object> get props => [registration];
}

final class RegistrationDetailError extends RegistrationDetailState {
  final String message;

  RegistrationDetailError(this.message);

  @override
  List<Object> get props => [message];
}
