import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/classroom_detail_with_subject.dart';
import '../../../domain/usecases/allocate_subject.dart';
import '../../../domain/usecases/get_classroom_details.dart';

part 'classroom_detail_state.dart';

@injectable
class ClassroomDetailCubit extends Cubit<ClassroomDetailState> {
  ClassroomDetailCubit(this._getClassroomById, this._allocateSubject)
      : super(ClassroomDetailInitial());

  GetClassroomDetails _getClassroomById;
  AllocateSubject _allocateSubject;

  Future<void> loadClassroom(int id) async {
    emit(ClassroomDetailLoading());
    final classroom = await _getClassroomById(id);
    classroom.fold(
      (failure) => emit(
          const ClassroomDetailError('Server Error: Failed to load classroom')),
      (classroom) => emit(ClassroomDetailLoaded(classroom)),
    );
  }

  Future<void> changeSubject(int classroomId, int subjectId) async {
    emit(ClassroomDetailLoading());
    final result =
        await _allocateSubject(AllocateSubjectParams(classroomId, subjectId));
    result.fold(
      (failure) => emit(
          const ClassroomDetailError('Server Error: Failed to change subject')),
      (classroom) {
        loadClassroom(classroomId);
      },
    );
  }
}
