import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';
import 'package:dr/Patient/features/offer/data/repositories/get_packages_repo.dart';
import 'package:dr/Patient/features/offer/presentation/cubit/offer_state/package_state.dart';
import 'package:dr/core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPackagesCubit extends Cubit<GetPackagesState> {
  final GetPackagesRepo getPackagesRepo;

  GetPackagesCubit({required this.getPackagesRepo}) : super(GetPackagesState());

  Future<void> GetPackages(BuildContext context) async {
    try {
      GetPackagesModel response = await getPackagesRepo.GetPackages();
      emit(state.copyWith(AllPackages: response));
    } catch (e) {
      print(e);
      ShowToastHelper.showToast(msg: e.toString(), isError: true);
    }
  }
}
