import 'package:class_alloc/core/modules/students/domain/entities/student.dart';
import 'package:class_alloc/core/modules/subjects/domain/entities/subject.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modules/students/domain/repositories/student_repository.dart';
import '../../../../core/modules/subjects/domain/repositories/subject_repository.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/registration_details.dart';
import '../repositories/registration_repository.dart';

@injectable
class GetRegistrationDetail implements UseCase<RegistrationDetails, int> {
  GetRegistrationDetail(
    this.registrationRepository,
    this.subjectRepository,
    this.studentRepository,
  );

  final RegistrationRepository registrationRepository;
  final SubjectRepository subjectRepository;
  final StudentRepository studentRepository;

  @override
  Future<Either<Failure, RegistrationDetails>> call(int id) async {
    final registration = await registrationRepository.getRegistrationById(id);
    return registration.fold(
      (failure) => Left(failure),
      (registration) async {
        final futureList = await Future.wait([
          subjectRepository.getSubjectById(registration.subjectId),
          studentRepository.getStudentById(registration.studentId),
        ]);
        final subject = futureList[0] as Either<Failure, Subject>;
        final student = futureList[1] as Either<Failure, Student>;

        return subject.fold(
          (failure) => Left(failure),
          (subject) => student.fold(
            (failure) => Left(failure),
            (student) => Right(
              RegistrationDetails(
                id: registration.id,
                subjectId: registration.subjectId,
                studentId: registration.studentId,
                subject: subject,
                student: student,
              ),
            ),
          ),
        );
      },
    );
  }
}
