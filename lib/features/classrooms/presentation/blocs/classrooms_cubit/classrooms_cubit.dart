import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/classroom.dart';
import '../../../domain/usecases/get_classrooms.dart';

part 'classrooms_state.dart';

@injectable
class ClassroomsCubit extends Cubit<ClassroomsState> {
  ClassroomsCubit(this._getClassrooms) : super(ClassroomsInitial());

  GetClassrooms _getClassrooms;

  Future<void> loadClassrooms() async {
    emit(ClassroomsLoading());
    final classrooms = await _getClassrooms(NoParams());
    classrooms.fold(
      (failure) => emit(
          const ClassroomsError('Server Error: Failed to load classrooms')),
      (classrooms) => emit(ClassroomsLoaded(classrooms)),
    );
  }
}
