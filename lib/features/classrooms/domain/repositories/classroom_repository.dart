import 'package:class_alloc/features/classrooms/domain/entities/classroom_detail.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/classroom.dart';

abstract class ClassroomRepository {
  Future<Either<Failure, List<Classroom>>> getClassrooms();
  Future<Either<Failure, ClassroomDetail>> getClassroom(int id);
  Future<Either<Failure, bool>> allocateSubject(int classroomId, int subjectId);
}
