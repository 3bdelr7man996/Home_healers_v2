part of 'offer_cubit.dart';

// ignore: must_be_immutable
class GetPackagesState extends Equatable {
  GetPackagesState({
    this.AllPackages,
  });

  var AllPackages;

  @override
  List<Object?> get props => [
        AllPackages,
      ];
  GetPackagesState copyWith({var AllPackages}) => GetPackagesState(
        AllPackages: AllPackages ?? this.AllPackages,
      );
}

// ignore: must_be_immutable
class GetOffersState extends Equatable {
  GetOffersState({
    this.AllOffers,
  });

  Map<String, dynamic>? AllOffers;

  @override
  List<Object?> get props => [
        AllOffers,
      ];
  GetOffersState copyWith({var AllOffers}) => GetOffersState(
        AllOffers: AllOffers ?? this.AllOffers,
      );
}
