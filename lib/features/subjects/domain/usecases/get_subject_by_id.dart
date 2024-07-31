import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subject.dart';
import '../repositories/subject_repository.dart';

@injectable
class GetSubjectById implements UseCase<Subject, int> {
  final SubjectRepository repository;

  GetSubjectById(this.repository);

  @override
  Future<Either<Failure, Subject>> call(int id) async {
    return await repository.getSubjectById(id);
  }
}
