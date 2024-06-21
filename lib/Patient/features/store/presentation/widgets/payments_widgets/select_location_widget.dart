import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/reservation_state.dart';
import 'package:dr/core/utils/app_colors.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

class SelectLocationWidget extends StatelessWidget {
  final TextEditingController control;
  SelectLocationWidget({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return TextFormField(
          key: const Key('signUpForm_SelectLocationWidget_textField'),
          controller: (control.text.isEmpty && state.address != null)
              ? TextEditingController(text: state.address)
              : control,
          readOnly: true,
          keyboardType: TextInputType.name,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapLocationPicker(
                  apiKey: AppStrings.mapApiKey,
                  onNext: (result) {
                    if (result != null) {
                      context.read<ReservationCubit>().onAddressChange(
                            result.formattedAddress ?? "",
                          );
                      context.read<ReservationCubit>().onLocationChange(
                            result.geometry.location,
                          );
                      control.text = result.formattedAddress ?? "";
                    }
                    Future.delayed(
                      Duration(seconds: 1),
                      () => Navigator.of(context).pop(),
                    );
                  },
                  location: state.location,
                  origin: context.read<AuthCubitForPatient>().state.location,
                  currentLatLng: LatLng(
                    state.location?.lat ?? 24.70281458492638,
                    state.location?.lng ?? 46.704172412998915,
                  ),
                ),
              ),
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required".tr();
            }
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ),
            ),
            hintText: "إضافة عنوان جديد",
            hintStyle: TextStyle(color: AppColors.primaryColor),
            suffixIcon: SizedBox(
              height: 18,
              width: 18,
              child: AppConstants.customAssetSvg(
                imagePath: "assets/icons/location_icon_for_payment.svg",
                fit: BoxFit.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
