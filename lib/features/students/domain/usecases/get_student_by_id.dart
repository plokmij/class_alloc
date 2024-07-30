import 'package:class_alloc/features/students/domain/entities/student.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/student_repository.dart';

class GetStudentById implements UseCase<Student, int> {
  final StudentRepository repository;

  GetStudentById(this.repository);

  @override
  Future<Either<Failure, Student>> call(int studentId) async {
    return repository.getStudentById(studentId);
  }
}
