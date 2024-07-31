import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/subject.dart';
import '../repositories/subject_repository.dart';

@injectable
class GetAllSubjects implements UseCase<List<Subject>, NoParams> {
  final SubjectRepository repository;

  GetAllSubjects(this.repository);

  @override
  Future<Either<Failure, List<Subject>>> call(NoParams params) async {
    return await repository.getAllSubjects();
  }
}
