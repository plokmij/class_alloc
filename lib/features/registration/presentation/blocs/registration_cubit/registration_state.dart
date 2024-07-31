part of 'registration_cubit.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationLoaded extends RegistrationState {
  final List<Registration> registrations;

  RegistrationLoaded(this.registrations);

  @override
  List<Object> get props => [registrations];
}

final class RegistrationError extends RegistrationState {
  final String message;

  RegistrationError(this.message);

  @override
  List<Object> get props => [message];
}
