import 'package:class_alloc/features/registration/domain/entities/registration.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/registration_repository.dart';

@injectable
class AddRegistration implements UseCase<Registration, AddRegistrationParams> {
  final RegistrationRepository repository;

  AddRegistration(this.repository);

  @override
  Future<Either<Failure, Registration>> call(
      AddRegistrationParams params) async {
    return await repository.registerStudent(
      params.studentId,
      params.subjectId,
    );
  }
}

class AddRegistrationParams {
  final int studentId;
  final int subjectId;

  AddRegistrationParams({
    required this.studentId,
    required this.subjectId,
  });
}
