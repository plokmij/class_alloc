import 'package:class_alloc/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/registration.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, List<Registration>>> getRegistrations();
  Future<Registration> getRegistrationById(int id);
  Future<Registration> registerStudent(int studentId, int subjectId);
  Future<Registration> removeRegistration(int registrationId);
}
