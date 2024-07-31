import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/modules/subjects/domain/entities/subject.dart';
import '../../../domain/usecases/get_subject_by_id.dart';

part 'subject_detail_state.dart';

@injectable
class SubjectDetailCubit extends Cubit<SubjectDetailState> {
  SubjectDetailCubit(this._getSubjectById) : super(SubjectDetailInitial());

  final GetSubjectById _getSubjectById;

  Future<void> loadSubject(int id) async {
    emit(SubjectDetailLoading());
    final subject = await _getSubjectById(id);
    subject.fold(
      (failure) => emit(
          const SubjectDetailError('Server Error: Failed to load subject')),
      (subject) => emit(SubjectDetailLoaded(subject)),
    );
  }
}
