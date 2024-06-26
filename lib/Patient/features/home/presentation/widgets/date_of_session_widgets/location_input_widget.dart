import 'package:dr/Patient/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_cubit/reservation_cubit.dart';
import 'package:dr/Patient/features/home/presentation/cubit/home_state/reservation_state.dart';
import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

class LocationInput extends StatelessWidget {
  final TextEditingController control;
  LocationInput({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    // final contextFirst = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "location".tr(),
          style: bigBlackFont(fontWeight: FontWeight.w500),
        ),
        5.ph,
        BlocBuilder<ReservationCubit, ReservationState>(
          builder: (context, state) {
            return TextFormField(
              key: const Key('signUpForm_locationInput_textField'),
              controller: (control.text.isEmpty && state.address != null)
                  ? TextEditingController(text: state.address)
                  : control,
              //initialValue: state.advertiser?.addressAr ?? "",
              readOnly: true,
              keyboardType: TextInputType.name,
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapLocationPicker(
                      apiKey: AppStrings.mapApiKey, // Put YOUR OWN KEY here.
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
                      origin:
                          context.read<AuthCubitForPatient>().state.location,
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
                hintText: "location".tr(),
                suffixIcon: SizedBox(
                  height: 18,
                  width: 18,
                  child: AppConstants.customAssetSvg(
                    imagePath:
                        AppImages.locationIcon, //AppImages.showPasswordIcon,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
