import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetAllStudents implements UseCase<List<Student>, NoParams> {
  final StudentRepository repository;

  GetAllStudents(this.repository);

  @override
  Future<Either<Failure, List<Student>>> call(NoParams params) async {
    return await repository.getAllStudents();
  }
}
