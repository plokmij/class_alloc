import 'package:bloc/bloc.dart';
import 'package:class_alloc/features/classrooms/domain/entities/classroom_detail.dart';
import 'package:class_alloc/features/classrooms/domain/usecases/get_classroom_by_id.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'classroom_detail_state.dart';

@injectable
class ClassroomDetailCubit extends Cubit<ClassroomDetailState> {
  ClassroomDetailCubit(this._getClassroomById)
      : super(ClassroomDetailInitial());

  GetClassroomById _getClassroomById;

  Future<void> loadClassroom(int id) async {
    emit(ClassroomDetailLoading());
    final classroom = await _getClassroomById(id);
    classroom.fold(
      (failure) => emit(
          const ClassroomDetailError('Server Error: Failed to load classroom')),
      (classroom) => emit(ClassroomDetailLoaded(classroom)),
    );
  }
}
