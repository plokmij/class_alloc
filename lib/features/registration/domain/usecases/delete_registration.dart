import 'package:class_alloc/core/error/failures.dart';
import 'package:class_alloc/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/registration_repository.dart';

class DeleteRegistration implements UseCase<bool, int> {
  final RegistrationRepository repository;

  DeleteRegistration(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await repository.removeRegistration(id);
  }
}
