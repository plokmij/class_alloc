import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/repositories/subject_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/classroom_detail_with_subject.dart';
import '../repositories/classroom_repository.dart';

@injectable
class GetClassroomDetails implements UseCase<ClassroomDetailWithSubject, int> {
  final ClassroomRepository classroomRepository;
  final SubjectRepository subjectRepository;

  GetClassroomDetails(this.classroomRepository, this.subjectRepository);

  @override
  Future<Either<Failure, ClassroomDetailWithSubject>> call(int id) async {
    final classRoomDetails = await classroomRepository.getClassroom(id);
    return classRoomDetails.fold(
      (failure) => Left(failure),
      (classroom) async {
        if (classroom.hasSubject) {
          final subject = await subjectRepository.getSubjectById(id);
          return subject.fold(
            (failure) => Left(failure),
            (subject) => Right(
              ClassroomDetailWithSubject(
                id: classroom.id,
                name: classroom.name,
                size: classroom.size,
                layout: classroom.layout,
                subject: subject,
                subjectId: classroom.subjectId,
              ),
            ),
          );
        } else {
          return Right(
            ClassroomDetailWithSubject(
              id: classroom.id,
              name: classroom.name,
              size: classroom.size,
              layout: classroom.layout,
              subjectId: classroom.subjectId,
            ),
          );
        }
      },
    );
  }
}
