import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/classroom.dart';
import '../../domain/entities/classroom_detail.dart';
import '../../domain/repositories/classroom_repository.dart';
import '../datasources/classroom_data_source.dart';

@Singleton(as: ClassroomRepository)
class ClassroomRepositoryImpl implements ClassroomRepository {
  final ClassroomDataSource classroomDataSource;

  const ClassroomRepositoryImpl({required this.classroomDataSource});

  @override
  Future<Either<Failure, List<Classroom>>> getClassrooms() async {
    try {
      final classrooms = await classroomDataSource.getClassrooms();
      return Right(classrooms);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> allocateSubject(
      int subjectId, int classroomId) async {
    try {
      final isAllocated =
          await classroomDataSource.allocateSubject(subjectId, classroomId);
      return Right(isAllocated);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClassroomDetail>> getClassroom(int id) async {
    try {
      final classroom = await classroomDataSource.getClassroom(id);
      return Right(classroom);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
