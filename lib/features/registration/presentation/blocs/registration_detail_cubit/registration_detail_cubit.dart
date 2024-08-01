import 'package:bloc/bloc.dart';
import 'package:class_alloc/features/registration/domain/usecases/delete_registration.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/registration_details.dart';
import '../../../domain/usecases/get_registration_detail.dart';

part 'registration_detail_state.dart';

@injectable
class RegistrationDetailCubit extends Cubit<RegistrationDetailState> {
  RegistrationDetailCubit(
    this._getRegistrationDetail,
    this._deleteRegistration,
  ) : super(RegistrationDetailState.initial());

  final GetRegistrationDetail _getRegistrationDetail;
  final DeleteRegistration _deleteRegistration;

  Future<void> loadRegistration(int id) async {
    emit(
      state.copyWith(isLoading: true),
    );
    final registration = await _getRegistrationDetail(id);
    registration.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load registration',
        ),
      ),
      (registration) => emit(state.copyWith(
        isLoading: false,
        registrationDetails: registration,
      )),
    );
  }

  Future<void> deleteRegistration(int id) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteRegistration(id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to delete registration',
        ),
      ),
      (success) => emit(
        state.copyWith(
          isLoading: false,
          deleteSuccess: success,
        ),
      ),
    );
  }

  void clear() {
    emit(RegistrationDetailState.initial());
  }
}
