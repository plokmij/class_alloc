import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/modules/subjects/domain/entities/subject.dart';
import '../../../domain/usecases/get_subject_detail.dart';

part 'subject_detail_state.dart';

@injectable
class SubjectDetailCubit extends Cubit<SubjectDetailState> {
  SubjectDetailCubit(this._getSubjectDetail) : super(SubjectDetailInitial());

  final GetSubjectDetail _getSubjectDetail;

  Future<void> loadSubject(int id) async {
    emit(SubjectDetailLoading());
    final subject = await _getSubjectDetail(id);
    subject.fold(
      (failure) => emit(
          const SubjectDetailError('Server Error: Failed to load subject')),
      (subject) => emit(SubjectDetailLoaded(subject)),
    );
  }
}
