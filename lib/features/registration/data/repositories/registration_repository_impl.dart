import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/registration.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasources/registration_data_source.dart';

@Singleton(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSource registrationDataSource;

  const RegistrationRepositoryImpl({required this.registrationDataSource});

  @override
  Future<Either<Failure, Registration>> getRegistrationById(int id) async {
    try {
      final registration = await registrationDataSource.getRegistrationById(id);
      return Right(registration);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Registration>>> getRegistrations() async {
    try {
      final registrations = await registrationDataSource.getRegistrations();
      return Right(registrations);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Registration>> registerStudent(
      int studentId, int subjectId) async {
    try {
      final registration =
          await registrationDataSource.registerStudent(studentId, subjectId);
      return Right(registration);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeRegistration(int registrationId) async {
    try {
      final response =
          await registrationDataSource.removeRegistration(registrationId);
      return Right(response);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
