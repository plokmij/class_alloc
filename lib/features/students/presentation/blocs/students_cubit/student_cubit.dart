import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/student.dart';
import '../../../domain/usecases/get_all_students.dart';

part 'student_state.dart';

@injectable
class StudentCubit extends Cubit<StudentState> {
  StudentCubit({required this.getAllStudents}) : super(StudentInitial());

  final GetAllStudents getAllStudents;

  Future<void> loadStudents() async {
    emit(StudentLoading());
    final students = await getAllStudents(NoParams());
    students.fold(
      (failure) =>
          emit(const StudentError('Server Error: Failed to load students')),
      (students) => emit(StudentLoaded(students)),
    );
  }
}
