// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';
import 'package:equatable/equatable.dart';

class GetOffersState extends Equatable {
  GetOffersState({
    this.AllOffers,
  });

  GetOffersModel? AllOffers;

  @override
  List<Object?> get props => [
        AllOffers,
      ];
  GetOffersState copyWith({var AllOffers}) => GetOffersState(
        AllOffers: AllOffers ?? this.AllOffers,
      );
}
