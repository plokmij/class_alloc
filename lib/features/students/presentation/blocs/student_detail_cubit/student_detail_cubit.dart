import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_detail_state.dart';

class StudentDetailCubit extends Cubit<StudentDetailState> {
  StudentDetailCubit() : super(StudentDetailInitial());
}
