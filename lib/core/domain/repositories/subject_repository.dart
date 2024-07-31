import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/subject.dart';

abstract class SubjectRepository {
  Future<Either<Failure, List<Subject>>> getAllSubjects();
  Future<Either<Failure, Subject>> getSubjectById(int id);
}
