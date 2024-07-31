import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';
import '../datasources/student_data_source.dart';

@Singleton(as: StudentRepository)
class StudentRepositoryImpl implements StudentRepository {
  final StudentDataSource studentDataSource;

  StudentRepositoryImpl({required this.studentDataSource});

  @override
  Future<Either<Failure, List<Student>>> getAllStudents() async {
    try {
      final students = await studentDataSource.getAllStudents();
      return Right(students);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Student>> getStudentById(int id) async {
    try {
      final student = await studentDataSource.getStudentById(id);
      return Right(student);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
