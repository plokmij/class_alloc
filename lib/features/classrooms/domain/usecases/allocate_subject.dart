import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/classroom_repository.dart';

class AllocateSubject implements UseCase<bool, AllocateSubjectParams> {
  final ClassroomRepository repository;

  AllocateSubject(this.repository);

  @override
  Future<Either<Failure, bool>> call(AllocateSubjectParams params) async {
    return await repository.allocateSubject(
        params.subjectId, params.classroomId);
  }
}

class AllocateSubjectParams extends Equatable {
  final int subjectId;
  final int classroomId;

  AllocateSubjectParams(this.subjectId, this.classroomId);

  @override
  List<Object> get props => [subjectId, classroomId];
}
