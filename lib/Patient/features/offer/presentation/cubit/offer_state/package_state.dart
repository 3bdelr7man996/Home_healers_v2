// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';
import 'package:equatable/equatable.dart';

class GetPackagesState extends Equatable {
  GetPackagesState({
    this.AllPackages,
  });

  GetPackagesModel? AllPackages;

  @override
  List<Object?> get props => [
        AllPackages,
      ];
  GetPackagesState copyWith({var AllPackages}) => GetPackagesState(
        AllPackages: AllPackages ?? this.AllPackages,
      );
}
