import 'package:class_alloc/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/registration.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, List<Registration>>> getRegistrations();
  Future<Either<Failure, Registration>> getRegistrationById(int id);
  Future<Either<Failure, Registration>> registerStudent(
      int studentId, int subjectId);
  Future<Either<Failure, bool>> removeRegistration(int registrationId);
}
