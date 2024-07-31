import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/domain/entities/subject.dart';
import '../../../../core/domain/repositories/subject_repository.dart';

@injectable
class GetSubjectById implements UseCase<Subject, int> {
  final SubjectRepository repository;

  GetSubjectById(this.repository);

  @override
  Future<Either<Failure, Subject>> call(int id) async {
    return await repository.getSubjectById(id);
  }
}
