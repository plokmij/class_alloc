import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/registration_details.dart';
import '../../../domain/usecases/get_registration_detail.dart';

part 'registration_detail_state.dart';

@injectable
class RegistrationDetailCubit extends Cubit<RegistrationDetailState> {
  RegistrationDetailCubit(this._getRegistrationDetail)
      : super(RegistrationDetailInitial());

  final GetRegistrationDetail _getRegistrationDetail;

  Future<void> loadRegistration(int id) async {
    emit(RegistrationDetailLoading());
    final registration = await _getRegistrationDetail(id);
    registration.fold(
      (failure) => emit(
          RegistrationDetailError('Server Error: Failed to load registration')),
      (registration) => emit(RegistrationDetailLoaded(registration)),
    );
  }
}
