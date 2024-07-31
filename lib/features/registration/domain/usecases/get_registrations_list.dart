import 'package:class_alloc/core/error/failures.dart';
import 'package:class_alloc/core/usecases/usecase.dart';
import 'package:class_alloc/features/registration/domain/entities/registration_details.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/modules/students/domain/repositories/student_repository.dart';
import '../../../../core/modules/subjects/domain/repositories/subject_repository.dart';
import '../repositories/registration_repository.dart';

class GetRegistrationsList
    implements UseCase<List<RegistrationDetails>, NoParams> {
  final RegistrationRepository registrationRepository;
  final StudentRepository studentRepository;
  final SubjectRepository subjectRepository;

  GetRegistrationsList(
    this.registrationRepository,
    this.studentRepository,
    this.subjectRepository,
  );

  @override
  Future<Either<Failure, List<RegistrationDetails>>> call(
      NoParams params) async {
    final registrations = await registrationRepository.getRegistrations();
    return registrations.fold(
      (failure) => Left(failure),
      (registrations) async {
        try {
          final List<RegistrationDetails> registrationDetails = [];
          for (var registration in registrations) {
            final student =
                await studentRepository.getStudentById(registration.studentId);
            final subject =
                await subjectRepository.getSubjectById(registration.subjectId);
            final registrationDetail = RegistrationDetails(
              id: registration.id,
              studentId: registration.studentId,
              subjectId: registration.subjectId,
              student: student.getOrElse(() => throw ServerFailure()),
              subject: subject.getOrElse(() => throw ServerFailure()),
            );
            registrationDetails.add(registrationDetail);
          }
          return Right(registrationDetails);
        } catch (_) {
          return Left(ServerFailure());
        }
      },
    );
  }
}
