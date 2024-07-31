import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/classroom.dart';
import '../repositories/classroom_repository.dart';

class GetClassroomById implements UseCase<Classroom, int> {
  final ClassroomRepository repository;

  GetClassroomById(this.repository);

  @override
  Future<Either<Failure, Classroom>> call(int id) async {
    return await repository.getClassroom(id);
  }
}
