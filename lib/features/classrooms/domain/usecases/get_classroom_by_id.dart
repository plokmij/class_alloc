import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/classroom_detail.dart';
import '../repositories/classroom_repository.dart';

class GetClassroomById implements UseCase<ClassroomDetail, int> {
  final ClassroomRepository repository;

  GetClassroomById(this.repository);

  @override
  Future<Either<Failure, ClassroomDetail>> call(int id) async {
    return await repository.getClassroom(id);
  }
}
