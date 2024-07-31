import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/subject.dart';
import '../../../domain/usecases/get_all_subjects.dart';

part 'subjects_state.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit(this._getAllSubjects) : super(SubjectsInitial());

  final GetAllSubjects _getAllSubjects;

  Future<void> loadSubjects() async {
    emit(SubjectsLoading());
    final subjects = await _getAllSubjects(NoParams());
    subjects.fold(
      (failure) =>
          emit(const SubjectsError('Server Error: Failed to load subjects')),
      (subjects) => emit(SubjectsLoaded(subjects)),
    );
  }
}
