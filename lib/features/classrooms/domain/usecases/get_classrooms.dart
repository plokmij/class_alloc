import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/classroom.dart';
import '../repositories/classroom_repository.dart';

@injectable
class GetClassrooms implements UseCase<List<Classroom>, NoParams> {
  final ClassroomRepository repository;

  GetClassrooms(this.repository);

  @override
  Future<Either<Failure, List<Classroom>>> call(NoParams params) async {
    return await repository.getClassrooms();
  }
}
