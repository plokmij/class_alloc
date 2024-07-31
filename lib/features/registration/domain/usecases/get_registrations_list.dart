import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/registration.dart';
import '../repositories/registration_repository.dart';

@injectable
class GetRegistrationsList implements UseCase<List<Registration>, NoParams> {
  final RegistrationRepository registrationRepository;

  GetRegistrationsList(
    this.registrationRepository,
  );

  @override
  Future<Either<Failure, List<Registration>>> call(NoParams params) async {
    final registrations = await registrationRepository.getRegistrations();
    return registrations.fold(
      (failure) => Left(failure),
      (registrations) => Right(registrations),
    );
  }
}
