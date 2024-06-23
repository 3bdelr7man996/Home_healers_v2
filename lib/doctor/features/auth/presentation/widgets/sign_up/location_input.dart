import 'package:dr/core/extensions/padding_extension.dart';
import 'package:dr/core/utils/app_contants.dart';
import 'package:dr/core/utils/app_font.dart';
import 'package:dr/core/utils/app_images.dart';
import 'package:dr/core/utils/app_strings.dart';
import 'package:dr/doctor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_location_picker/map_location_picker.dart';

class LocationInput extends StatelessWidget {
  final TextEditingController control = TextEditingController();
  LocationInput({
    super.key,
  });

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
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              previous.address != current.address ||
              previous.advertiser != current.advertiser,
          builder: (context, state) {
            return TextFormField(
              key: const Key('signUpForm_locationInput_textField'),
              controller: (control.text.isEmpty && state.advertiser != null)
                  ? TextEditingController(text: state.advertiser?.addressAr)
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
                        Future.delayed(Duration(seconds: 1), () {
                          if (result != null) {
                          
                            print(result.addressComponents.fold("",
                                    (pValue, e) {
                                  e.types.forEach((type) {
                                    print(type);
                                    if (type == "locality" ||
                                        type == "sublocality") {
                                      pValue += e.shortName + " ";
                                    }
                                  });
                                  return pValue;
                                }).trim());
                            context.read<AuthCubit>().onAddressChange(
                                address: result.addressComponents.fold("",
                                    (pValue, e) {
                                  e.types.forEach((type) {
                                    if (type == "locality" ||
                                        type == "sublocality") {
                                      pValue += e.shortName + " ";
                                    }
                                  });
                                  return pValue;
                                }).trim(), // result.formattedAddress,
                                location: result.geometry.location);

                            control.text = result.formattedAddress ?? "";
                          }
                          Future.delayed(
                            Duration.zero,
                            () => Navigator.of(context).pop(),
                          );
                        });
                      },
                      language: "ar",
                      hideMapTypeButton: true,
                      hideMoreOptions: true,
                      location: state.location,
                      origin: state.location,
                      currentLatLng: LatLng(
                          state.location?.lat ?? 24.70281458492638,
                          state.location?.lng ?? 46.704172412998915),
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
