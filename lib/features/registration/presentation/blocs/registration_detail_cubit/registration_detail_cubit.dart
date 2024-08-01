import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/registration_details.dart';
import '../../../domain/usecases/get_registration_detail.dart';

part 'registration_detail_state.dart';

@injectable
class RegistrationDetailCubit extends Cubit<RegistrationDetailState> {
  RegistrationDetailCubit(this._getRegistrationDetail)
      : super(RegistrationDetailState.initial());

  final GetRegistrationDetail _getRegistrationDetail;

  Future<void> loadRegistration(int id) async {
    emit(state.copyWith(isLoading: true));
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
}
