part of 'offer_cubit.dart';

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
