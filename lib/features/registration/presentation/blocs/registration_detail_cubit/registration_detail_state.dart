part of 'registration_detail_cubit.dart';

final class RegistrationDetailState extends Equatable {
  const RegistrationDetailState({
    required this.registration,
    required this.isLoading,
    required this.deleteSuccess,
    required this.errorMessage,
  });

  final RegistrationDetails? registration;
  final bool isLoading;
  final bool deleteSuccess;
  final String? errorMessage;

  bool get isFailure => errorMessage != null;

  factory RegistrationDetailState.initial() {
    return RegistrationDetailState(
      registration: null,
      isLoading: false,
      deleteSuccess: false,
      errorMessage: null,
    );
  }

  RegistrationDetailState copyWith({
    RegistrationDetails? registrationDetails,
    bool? isLoading,
    bool? deleteSuccess,
    String? errorMessage,
  }) {
    return RegistrationDetailState(
      registration: registrationDetails ?? this.registration,
      isLoading: isLoading ?? this.isLoading,
      deleteSuccess: deleteSuccess ?? this.deleteSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        registration,
        isLoading,
        deleteSuccess,
        errorMessage,
      ];
}
