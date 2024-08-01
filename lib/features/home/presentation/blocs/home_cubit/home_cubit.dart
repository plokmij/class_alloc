import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/home_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void toggleListingMode() {
    emit(
      HomeState(
        listingMode: state.listingMode == ListingMode.grid
            ? ListingMode.list
            : ListingMode.grid,
      ),
    );
  }
}
