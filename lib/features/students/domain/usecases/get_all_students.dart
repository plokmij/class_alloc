import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/modules/students/domain/entities/student.dart';
import '../../../../core/modules/students/domain/repositories/student_repository.dart';

@injectable
class GetAllStudents implements UseCase<List<Student>, NoParams> {
  final StudentRepository repository;

  GetAllStudents(this.repository);

  @override
  Future<Either<Failure, List<Student>>> call(NoParams params) async {
    return await repository.getAllStudents();
  }
}
