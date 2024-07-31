import 'package:class_alloc/core/error/failures.dart';
import 'package:class_alloc/features/subjects/data/datasources/subject_data_source.dart';
import 'package:class_alloc/features/subjects/domain/entities/subject.dart';
import 'package:class_alloc/features/subjects/domain/repositories/subject_repository.dart';
import 'package:dartz/dartz.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectDataSource subjectDataSource;

  const SubjectRepositoryImpl({required this.subjectDataSource});

  @override
  Future<Either<Failure, List<Subject>>> getAllSubjects() async {
    try {
      final subjects = await subjectDataSource.getAllSubjects();
      return Right(subjects);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Subject>> getSubjectById(int id) async {
    try {
      final subject = await subjectDataSource.getSubjectById(id);
      return Right(subject);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
