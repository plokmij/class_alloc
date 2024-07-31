import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/registration.dart';
import '../../../domain/usecases/get_registrations_list.dart';

part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._getRegistrations) : super(RegistrationInitial());

  final GetRegistrationsList _getRegistrations;

  void loadRegistrations() async {
    emit(RegistrationLoading());
    final registrations = await _getRegistrations(NoParams());
    registrations.fold(
      (failure) =>
          emit(RegistrationError('Server Error: Failed to load registrations')),
      (registrations) => emit(
        RegistrationLoaded(registrations),
      ),
    );
  }
}
