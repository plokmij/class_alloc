import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/modules/students/domain/entities/student.dart';
import '../../../domain/usecases/get_student_detail.dart';

part 'student_detail_state.dart';

@injectable
class StudentDetailCubit extends Cubit<StudentDetailState> {
  StudentDetailCubit({required GetStudentDetail getStudentById})
      : _getStudentById = getStudentById,
        super(StudentDetailInitial());

  final GetStudentDetail _getStudentById;

  Future<void> getStudent(int studentId) async {
    emit(StudentDetailLoading());
    final result = await _getStudentById(studentId);
    result.fold(
      (failure) => emit(StudentDetailError('Unable to load student')),
      (student) => emit(StudentDetailLoaded(student)),
    );
  }
}
