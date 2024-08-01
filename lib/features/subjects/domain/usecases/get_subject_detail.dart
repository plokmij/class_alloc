import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/modules/subjects/domain/entities/subject.dart';
import '../../../../core/modules/subjects/domain/repositories/subject_repository.dart';

@injectable
class GetSubjectDetail implements UseCase<Subject, int> {
  final SubjectRepository repository;

  GetSubjectDetail(this.repository);

  @override
  Future<Either<Failure, Subject>> call(int id) async {
    return await repository.getSubjectById(id);
  }
}