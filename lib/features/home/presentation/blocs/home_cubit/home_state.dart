part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({required this.listingMode});

  final ListingMode listingMode;

  factory HomeState.initial() => const HomeState(listingMode: ListingMode.grid);

  bool get isGridMode => listingMode == ListingMode.grid;
  bool get isListMode => listingMode == ListingMode.list;

  @override
  List<Object> get props => [
        listingMode,
      ];
}
