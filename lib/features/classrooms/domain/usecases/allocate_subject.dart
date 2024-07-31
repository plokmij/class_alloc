import 'package:class_alloc/features/classrooms/domain/entities/classroom_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/classroom_repository.dart';

@injectable
class AllocateSubject
    implements UseCase<ClassroomDetail, AllocateSubjectParams> {
  final ClassroomRepository repository;

  AllocateSubject(this.repository);

  @override
  Future<Either<Failure, ClassroomDetail>> call(
      AllocateSubjectParams params) async {
    return await repository.allocateSubject(
      params.subjectId,
      params.classroomId,
    );
  }
}

class AllocateSubjectParams extends Equatable {
  final int subjectId;
  final int classroomId;

  AllocateSubjectParams(this.subjectId, this.classroomId);

  @override
  List<Object> get props => [subjectId, classroomId];
}
