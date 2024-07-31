import 'package:class_alloc/core/modules/students/domain/entities/student.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/modules/students/domain/repositories/student_repository.dart';

@injectable
class GetStudentById implements UseCase<Student, int> {
  final StudentRepository repository;

  GetStudentById(this.repository);

  @override
  Future<Either<Failure, Student>> call(int studentId) async {
    return await repository.getStudentById(studentId);
  }
}
