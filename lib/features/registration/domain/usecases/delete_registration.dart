import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/registration_repository.dart';

@injectable
class DeleteRegistration implements UseCase<bool, int> {
  final RegistrationRepository repository;

  DeleteRegistration(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await repository.removeRegistration(id);
  }
}
